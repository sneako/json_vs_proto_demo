input = %{
  event: "imp",
  event_time: :erlang.system_time(:seconds) |> Integer.to_string(),
  account_id: "qwerty",
  auction_id: "4234534524-2542345234",
  auid: 23425,
  bid_request_id: "jhk23j4h2hk",
  bundle: "com.great.app",
  context: "good yes great",
  country_code: "CH",
  creative_type: "video",
  cpm: 10.25,
  error: "JavaException",
  impression: 100,
  impression_id: "2432354645745-373467356",
  ip: "54.12.43.8",
  lang: "en",
  line_item_id: 2031,
  mcc: 101,
  os_version: "7.1.1",
  rtt: 50.123,
  sample_rate: 1.0,
  screen_height: 900,
  screen_width: 700,
  user_agent: "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0",
  version: "3.0.5-kh243k"
}

protox_msg_struct = struct(ProtoxMsg, input)
proto_msg =
  protox_msg_struct
  |> Protox.Encode.encode!()
  |> IO.iodata_to_binary()

fb_schema =
  Path.join([__DIR__, "..", "priv", "flatbuffers.fbs"])
  |> File.read!()
  |> Eflatbuffers.Schema.parse!()


flatbuffer_msg = Eflatbuffers.write!(input, fb_schema)

json_msg = Jason.encode!(input)

t2b_msg = :erlang.term_to_binary(input)

msgpax_msg = Msgpax.pack!(input) |> IO.iodata_to_binary()

IO.puts "Erlang term_to_binary/1 size: #{byte_size(t2b_msg)} bytes"
IO.puts "Protobuf encoded size: #{byte_size(proto_msg)} bytes"
IO.puts "JSON encoded size: #{byte_size(json_msg)} bytes"
IO.puts "Flatbuffers encoded size: #{byte_size(flatbuffer_msg)} bytes"
IO.puts "MessagePack encoded size: #{byte_size(msgpax_msg)} bytes"

protobuf = fn ->
  protox_msg_struct
  |> Protox.Encode.encode!()
  |> IO.iodata_to_binary()
  |> ProtoxMsg.decode!()
end

msgpax = fn ->
  input
  |> Msgpax.pack!()
  |> Msgpax.unpack!()
end

poison = fn ->
  Poison.encode!(input)
  |> Poison.decode()
end

jason = fn ->
  input
  |> Jason.encode!()
  |> Jason.decode!()
end

term_to_binary = fn ->
  :erlang.term_to_binary(input)
  |> :erlang.binary_to_term()
end

flatbuffers = fn ->
  Eflatbuffers.write!(input, fb_schema)
  |> Eflatbuffers.read!(fb_schema)
end

# Flatbuffers also allow quick random access without unpacking the whole message

Benchee.run(
  %{
    "protobuf" => fn -> protobuf.() end,
    "msgpax" => fn -> msgpax.() end,
    "jason" => fn -> jason.() end,
    "poison" => fn -> poison.() end,
    "flatbuffers" => fn -> flatbuffers.() end,
    "term_to_binary" => fn -> term_to_binary.() end
  },
  parallel: 8
)
Benchee.run(
  %{
    "protobuf_decode" => fn -> ProtoxMsg.decode(proto_msg) end,
    "msgpax_decode" => fn -> Msgpax.unpack!(msgpax_msg) end,
    "jason_decode" => fn -> Jason.decode(json_msg) end,
    "poison_decode" => fn -> Poison.decode(json_msg) end,
    "flatbuffers_decode" => fn -> Eflatbuffers.read!(flatbuffer_msg, fb_schema) end
  },
  parallel: 8
)

Benchee.run(
  %{
    "protobuf_encode" => fn -> Protox.Encode.encode!(protox_msg_struct) |> IO.iodata_to_binary() end,
    "msgpax_encode" => fn -> Msgpax.pack!(input) end,
    "jason_encode" => fn -> Jason.encode(input) end,
    "poison_encode" => fn -> Poison.encode!(input) end,
    "flatbuffers_encode" => fn -> Eflatbuffers.write!(input, fb_schema) end
  },
  parallel: 8
)
