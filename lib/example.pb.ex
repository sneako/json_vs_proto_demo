defmodule TonyProto do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          event: String.t(),
          event_time: String.t(),
          account_id: String.t(),
          auction_id: String.t(),
          auid: integer,
          bid_request_id: String.t(),
          bundle: String.t(),
          context: String.t(),
          country_code: String.t(),
          creative_type: String.t(),
          cpm: float | :infinity | :negative_infinity | :nan,
          error: String.t(),
          impression: non_neg_integer,
          impression_id: String.t(),
          ip: String.t(),
          lang: String.t(),
          line_item_id: non_neg_integer,
          mcc: non_neg_integer,
          os_version: String.t(),
          rtt: float | :infinity | :negative_infinity | :nan,
          sample_rate: float | :infinity | :negative_infinity | :nan,
          screen_height: non_neg_integer,
          screen_width: non_neg_integer,
          uid: String.t(),
          user_agent: String.t(),
          version: String.t()
        }

  defstruct [
    :event,
    :event_time,
    :account_id,
    :auction_id,
    :auid,
    :bid_request_id,
    :bundle,
    :context,
    :country_code,
    :creative_type,
    :cpm,
    :error,
    :impression,
    :impression_id,
    :ip,
    :lang,
    :line_item_id,
    :mcc,
    :os_version,
    :rtt,
    :sample_rate,
    :screen_height,
    :screen_width,
    :uid,
    :user_agent,
    :version
  ]

  field :event, 1, type: :string
  field :event_time, 2, type: :string
  field :account_id, 3, type: :string
  field :auction_id, 4, type: :string
  field :auid, 5, type: :int64
  field :bid_request_id, 6, type: :string
  field :bundle, 7, type: :string
  field :context, 8, type: :string
  field :country_code, 9, type: :string
  field :creative_type, 10, type: :string
  field :cpm, 11, type: :float
  field :error, 12, type: :string
  field :impression, 13, type: :uint32
  field :impression_id, 14, type: :string
  field :ip, 15, type: :string
  field :lang, 16, type: :string
  field :line_item_id, 17, type: :uint32
  field :mcc, 18, type: :uint32
  field :os_version, 19, type: :string
  field :rtt, 20, type: :float
  field :sample_rate, 21, type: :float
  field :screen_height, 22, type: :uint32
  field :screen_width, 23, type: :uint32
  field :uid, 24, type: :string
  field :user_agent, 25, type: :string
  field :version, 26, type: :string
end

defmodule RealMsg do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          event: String.t(),
          event_time: non_neg_integer,
          device_id: String.t(),
          application_identifier: String.t(),
          member_id: String.t(),
          uid: String.t(),
          adunit_identifier: String.t(),
          adunit_id: String.t(),
          domain: String.t(),
          sdk_wrapper_version: String.t(),
          version: String.t(),
          system_type: String.t(),
          robojeff_version: String.t(),
          session_id: String.t(),
          demand_type: String.t(),
          referrer: String.t(),
          configuration_version: String.t(),
          mnc: String.t(),
          mcc: String.t(),
          ad_height: non_neg_integer,
          ad_width: non_neg_integer,
          dma_code: non_neg_integer,
          test_mode: boolean,
          line_item_id: non_neg_integer,
          adapter: String.t(),
          impression: non_neg_integer,
          buyeruid_type: String.t(),
          buyeruid: String.t(),
          creative_type: non_neg_integer,
          bid_id: String.t(),
          app_version: String.t(),
          bundle: String.t(),
          cpm: float | :infinity | :negative_infinity | :nan,
          net_cpm: float | :infinity | :negative_infinity | :nan,
          int_cpm: non_neg_integer,
          gross_cpm: float | :infinity | :negative_infinity | :nan,
          rtt: non_neg_integer,
          adomain: String.t(),
          crid: String.t(),
          cid: String.t(),
          custom_1: String.t(),
          custom_2: String.t(),
          custom_3: String.t(),
          custom_4: String.t(),
          custom_n: integer,
          custom_n2: float | :infinity | :negative_infinity | :nan,
          custom_n3: float | :infinity | :negative_infinity | :nan,
          description: String.t(),
          user_first_seen_at: non_neg_integer
        }

  defstruct [
    :event,
    :event_time,
    :device_id,
    :application_identifier,
    :member_id,
    :uid,
    :adunit_identifier,
    :adunit_id,
    :domain,
    :sdk_wrapper_version,
    :version,
    :system_type,
    :robojeff_version,
    :session_id,
    :demand_type,
    :referrer,
    :configuration_version,
    :mnc,
    :mcc,
    :ad_height,
    :ad_width,
    :dma_code,
    :test_mode,
    :line_item_id,
    :adapter,
    :impression,
    :buyeruid_type,
    :buyeruid,
    :creative_type,
    :bid_id,
    :app_version,
    :bundle,
    :cpm,
    :net_cpm,
    :int_cpm,
    :gross_cpm,
    :rtt,
    :adomain,
    :crid,
    :cid,
    :custom_1,
    :custom_2,
    :custom_3,
    :custom_4,
    :custom_n,
    :custom_n2,
    :custom_n3,
    :description,
    :user_first_seen_at
  ]

  field :event, 1, type: :string
  field :event_time, 2, type: :uint32
  field :device_id, 3, type: :string
  field :application_identifier, 4, type: :string
  field :member_id, 5, type: :string
  field :uid, 6, type: :string
  field :adunit_identifier, 7, type: :string
  field :adunit_id, 8, type: :string
  field :domain, 9, type: :string
  field :sdk_wrapper_version, 10, type: :string
  field :version, 11, type: :string
  field :system_type, 12, type: :string
  field :robojeff_version, 13, type: :string
  field :session_id, 14, type: :string
  field :demand_type, 15, type: :string
  field :referrer, 16, type: :string
  field :configuration_version, 17, type: :string
  field :mnc, 18, type: :string
  field :mcc, 19, type: :string
  field :ad_height, 20, type: :uint32
  field :ad_width, 21, type: :uint32
  field :dma_code, 22, type: :uint32
  field :test_mode, 23, type: :bool
  field :line_item_id, 24, type: :uint64
  field :adapter, 25, type: :string
  field :impression, 26, type: :uint32
  field :buyeruid_type, 27, type: :string
  field :buyeruid, 28, type: :string
  field :creative_type, 29, type: :uint32
  field :bid_id, 30, type: :string
  field :app_version, 31, type: :string
  field :bundle, 32, type: :string
  field :cpm, 33, type: :float
  field :net_cpm, 34, type: :float
  field :int_cpm, 35, type: :uint32
  field :gross_cpm, 36, type: :float
  field :rtt, 37, type: :uint32
  field :adomain, 38, type: :string
  field :crid, 39, type: :string
  field :cid, 40, type: :string
  field :custom_1, 41, type: :string
  field :custom_2, 42, type: :string
  field :custom_3, 43, type: :string
  field :custom_4, 44, type: :string
  field :custom_n, 45, type: :int32
  field :custom_n2, 46, type: :double
  field :custom_n3, 47, type: :double
  field :description, 48, type: :string
  field :user_first_seen_at, 49, type: :uint32
end
