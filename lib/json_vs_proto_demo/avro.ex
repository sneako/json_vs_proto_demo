defmodule JsonVsProtoDemo.Avro do
  @schema """
  {
    "type": "record",
    "name": "MessageWithStrings",
    "fields": [
      {"name": "event", "type": ["null", "string"], "default": null},
      {"name": "event_time", "type": ["null", "string"], "default": null},
      {"name": "account_id", "type": ["null", "string"], "default": null},
      {"name": "auction_id", "type": ["null", "string"], "default": null},
      {"name": "auid", "type": ["null", "long"], "default": null},
      {"name": "bid_request_id", "type": ["null", "string"], "default": null},
      {"name": "bundle", "type": ["null", "string"], "default": null},
      {"name": "context", "type": ["null", "string"], "default": null},
      {"name": "country_code", "type": ["null", "string"], "default": null},
      {"name": "creative_type", "type": ["null", "string"], "default": null},
      {"name": "cpm", "type": ["null", "double"], "default": null},
      {"name": "error", "type": ["null", "string"], "default": null},
      {"name": "impression", "type": ["null", "int"], "default": null},
      {"name": "impression_id", "type": ["null", "string"], "default": null},
      {"name": "ip", "type": ["null", "string"], "default": null},
      {"name": "lang", "type": ["null", "string"], "default": null},
      {"name": "line_item_id", "type": ["null", "int"], "default": null},
      {"name": "mcc", "type": ["null", "int"], "default": null},
      {"name": "os_version", "type": ["null", "string"], "default": null},
      {"name": "rtt", "type": ["null", "double"], "default": null},
      {"name": "sample_rate", "type": ["null", "double"], "default": null},
      {"name": "screen_height", "type": ["null", "int"], "default": null},
      {"name": "screen_width", "type": ["null", "int"], "default": null},
      {"name": "user_agent", "type": ["null", "string"], "default": null},
      {"name": "version", "type": ["null", "string"], "default": null}
    ]
  }
  """

  def encoder, do: :avro.make_simple_encoder(@schema, [])
  def decoder, do: :avro.make_simple_decoder(@schema, [])
end
