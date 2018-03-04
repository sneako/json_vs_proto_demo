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

proto_msg =
  JsonVsProtoDemo.Msg.new(input)
  |> JsonVsProtoDemo.Msg.encode()

json_msg = :jiffy.encode(input)

t2b_msg = :erlang.term_to_binary(input)

IO.puts "Erlang term_to_binary/1 size: #{byte_size(t2b_msg)} bytes"
IO.puts "Protobuf encoded size: #{byte_size(proto_msg)} bytes"
IO.puts "JSON encoded size: #{byte_size(json_msg)} bytes"

protobuf = fn ->
  JsonVsProtoDemo.Msg.new(input)
  |> JsonVsProtoDemo.Msg.encode()
  |> JsonVsProtoDemo.Msg.decode()
end

jiffy = fn ->
  :jiffy.encode(input)
  |> :jiffy.decode([:return_maps])
end

poison = fn ->
  Poison.encode!(input)
  |> Poison.decode()
end

term_to_binary = fn ->
  :erlang.term_to_binary(input)
  |> :erlang.binary_to_term()
end

Benchee.run(
  %{
    "protobuf" => fn -> protobuf.() end,
    "jiffy" => fn -> jiffy.() end,
    "poison" => fn -> poison.() end,
    "term_to_binary" => fn -> term_to_binary.() end,
  },
  parallel: 8
)
Benchee.run(
  %{
    "protobuf_decode" => fn -> JsonVsProtoDemo.Msg.decode(proto_msg) end,
    "jiffy_decode" => fn -> :jiffy.decode(json_msg, [:return_maps]) end,
    "poison_decode" => fn -> Poison.decode(json_msg) end,
  },
  parallel: 8
)

Benchee.run(
  %{
    "protobuf_encode" => fn -> JsonVsProtoDemo.Msg.new(input) |> JsonVsProtoDemo.Msg.encode() end,
    "jiffy_encode" => fn -> :jiffy.encode(input) end,
    "poison_encode" => fn -> Poison.encode!(input) end,
  },
  parallel: 8
)
