alias JsonVsProtoDemo.Avro

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

emtpy_input = input |> Enum.map(fn {k, _} -> {k, nil} end) |> Enum.into(%{})
avro_encoder = Avro.encoder()
avro_decoder = Avro.decoder()
empty_avro = avro_encoder.(emtpy_input) |> IO.iodata_to_binary()
avro_msg = avro_encoder.(input) |> IO.iodata_to_binary()

protox_msg_struct = struct(ProtoxMsg, input)

proto_msg =
  protox_msg_struct
  |> Protox.Encode.encode!()
  |> IO.iodata_to_binary()

empty_proto_msg =
  %ProtoxMsg{}
  |> Protox.Encode.encode!()
  |> IO.iodata_to_binary()

empty_real_msg =
  %RealMsg{}
  |> Protox.Encode.encode!()
  |> IO.iodata_to_binary()

tony_proto_msg = TonyProto.new(input) |> TonyProto.encode()

fb_schema =
  Path.join([__DIR__, "..", "priv", "flatbuffers.fbs"])
  |> File.read!()
  |> Eflatbuffers.Schema.parse!()

flatbuffer_msg = Eflatbuffers.write!(input, fb_schema)
empty_flatbuffer_msg = Eflatbuffers.write!(%{}, fb_schema)

json_msg = Jason.encode!(input)

t2b_msg = :erlang.term_to_binary(input)

msgpax_msg = Msgpax.pack!(input) |> IO.iodata_to_binary()
empty_msgpax_msg = Msgpax.pack!(%{}) |> IO.iodata_to_binary()

IO.puts("Erlang term_to_binary/1 size: #{byte_size(t2b_msg)} bytes")
IO.puts("Protobuf encoded size: #{byte_size(proto_msg)} bytes")
IO.puts("Empty Protobuf encoded size: #{byte_size(empty_proto_msg)} bytes")
IO.puts("Empty Real Protobuf encoded size: #{byte_size(empty_real_msg)} bytes")
IO.puts("JSON encoded size: #{byte_size(json_msg)} bytes")
IO.puts("Flatbuffers encoded size: #{byte_size(flatbuffer_msg)} bytes")
IO.puts("Empty Flatbuffer size: #{byte_size(empty_flatbuffer_msg)} bytes")
IO.puts("MessagePack encoded size: #{byte_size(msgpax_msg)} bytes")
IO.puts("Empty MessagePack encoded size: #{byte_size(empty_msgpax_msg)} bytes")
IO.puts("Emtpy Avro #{byte_size(empty_avro)} bytes")
IO.puts("Avro #{byte_size(avro_msg)} bytes")
IO.puts("URI.encode_query #{byte_size(URI.encode_query(input))}")
IO.puts("\n\n\n")

avro = fn ->
  input
  |> avro_encoder.()
  |> avro_decoder.()
end

protox = fn ->
  protox_msg_struct
  |> Protox.Encode.encode!()
  |> IO.iodata_to_binary()
  |> ProtoxMsg.decode!()
end

tony_proto = fn ->
  input
  |> TonyProto.new()
  |> TonyProto.encode()
  |> TonyProto.decode()
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

# Benchee.run(
#   %{
#     "protox" => fn -> protox.() end,
#     "avro" => fn -> avro.() end,
#     "tony_proto" => fn -> tony_proto.() end,
#     "msgpax" => fn -> msgpax.() end,
#     "jason" => fn -> jason.() end,
#     "flatbuffers" => fn -> flatbuffers.() end
#   },
#   parallel: 8
# )

# Benchee.run(
#   %{
#     "protobuf_decode" => fn -> ProtoxMsg.decode(proto_msg) end,
#     "msgpax_decode" => fn -> Msgpax.unpack!(msgpax_msg) end,
#     "jason_decode" => fn -> Jason.decode(json_msg) end,
#     "poison_decode" => fn -> Poison.decode(json_msg) end,
#     "flatbuffers_decode" => fn -> Eflatbuffers.read!(flatbuffer_msg, fb_schema) end
#   },
#   parallel: 8
# )
tony =
  input
  |> TonyProto.new()
  |> TonyProto.encode()

Benchee.run(
  %{
    "protox encode" => fn ->
      Protox.Encode.encode!(protox_msg_struct) |> IO.iodata_to_binary()
    end,
    "avro_encode" => fn ->
      avro_encoder.(input) |> IO.iodata_to_binary()
    end,
    "tony_proto encode" => fn ->
      input
      |> TonyProto.new()
      |> TonyProto.encode()
    end,
    "msgpax_encode" => fn -> Msgpax.pack!(input) |> IO.iodata_to_binary() end,
    "jason_encode" => fn -> Jason.encode(input) end,
    "flatbuffers_encode" => fn -> Eflatbuffers.write!(input, fb_schema) end
  },
  parallel: 8
)
