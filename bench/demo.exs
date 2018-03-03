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

protomsg =
  JsonVsProtoDemo.Msg.new(input)
  |> JsonVsProtoDemo.Msg.encode()

IO.puts "Protobuf encoded size: #{byte_size(protomsg)} bytes"
IO.puts "JSON encoded size: #{:jiffy.encode(input) |> byte_size()} bytes"

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

Benchee.run(
  %{
    "protobuf" => fn -> protobuf.() end,
    "jiffy" => fn -> jiffy.() end,
    "poison" => fn -> poison.() end
  },
  parallel: 8
)
