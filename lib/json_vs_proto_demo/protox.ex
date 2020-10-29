defmodule JsonVsProtoDemo.Protox do
  use Protox, schema: """
    syntax = "proto2";

    message ProtoxMsg {
      required string event = 1;
      required string event_time = 2;
      optional string account_id = 3;
      optional string auction_id = 4;
      optional int64 auid = 5;
      optional string bid_request_id = 6;
      optional string bundle = 7;
      optional string context = 8;
      optional string country_code = 9;
      optional string creative_type = 10;
      optional float cpm = 11;
      optional string error = 12;
      optional uint32 impression = 13;
      optional string impression_id = 14;
      optional string ip = 15;
      optional string lang = 16;
      optional uint32 line_item_id = 17;
      optional uint32 mcc = 18;
      optional string os_version = 19;
      optional float rtt = 20;
      optional float sample_rate = 21;
      optional uint32 screen_height = 22;
      optional uint32 screen_width = 23;
      optional string uid = 24;
      optional string user_agent = 25;
      optional string version = 26;
  }
  """
end
