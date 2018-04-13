# JsonVsProtoDemo
Super quick/basic benchmark to compare serialization/deserialization performance between Protobuf and JSON in Elixir.

Results on my machine:
```
Erlang term_to_binary/1 size: 647 bytes
Protobuf encoded size: 300 bytes
JSON encoded size: 603 bytes
Flatbuffers encoded size: 427 bytes

Operating System: Linux
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 15.52 GB
Elixir 1.6.4
Erlang 20.0
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
parallel: 8
inputs: none specified
Estimated total run time: 35 s


Benchmarking flatbuffers...
Benchmarking jiffy...
Benchmarking poison...
Benchmarking protobuf...
Benchmarking term_to_binary...


Name                     ips        average  deviation         median         99th %
term_to_binary      121.21 K        8.25 μs   ±862.96%           7 μs          12 μs
flatbuffers          25.40 K       39.38 μs   ±250.07%          36 μs         116 μs
jiffy                17.23 K       58.03 μs   ±239.08%          54 μs         103 μs
poison                7.95 K      125.79 μs   ±300.16%         109 μs         218 μs
protobuf              5.68 K      176.00 μs   ±180.83%         162 μs         291 μs

Comparison: 
term_to_binary      121.21 K
flatbuffers          25.40 K - 4.77x slower
jiffy                17.23 K - 7.03x slower
poison                7.95 K - 15.25x slower
protobuf              5.68 K - 21.33x slower
Operating System: Linux
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 15.52 GB
Elixir 1.6.4
Erlang 20.0
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
parallel: 8
inputs: none specified
Estimated total run time: 28 s


Benchmarking flatbuffers_decode...
Benchmarking jiffy_decode...
Benchmarking poison_decode...
Benchmarking protobuf_decode...

Name                         ips        average  deviation         median         99th %
flatbuffers_decode       50.37 K       19.85 μs   ±516.30%          18 μs          32 μs
jiffy_decode             23.71 K       42.17 μs   ±350.30%          37 μs          73 μs
poison_decode            16.30 K       61.35 μs   ±272.95%          57 μs          79 μs
protobuf_decode          10.65 K       93.87 μs   ±204.92%          86 μs         138 μs

Comparison: 
flatbuffers_decode       50.37 K
jiffy_decode             23.71 K - 2.12x slower
poison_decode            16.30 K - 3.09x slower
protobuf_decode          10.65 K - 4.73x slower
Operating System: Linux
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 15.52 GB
Elixir 1.6.4
Erlang 20.0
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
parallel: 8
inputs: none specified
Estimated total run time: 28 s


Benchmarking flatbuffers_encode...
Benchmarking jiffy_encode...
Benchmarking poison_encode...
Benchmarking protobuf_encode...

Name                         ips        average  deviation         median         99th %
jiffy_encode             44.28 K       22.59 μs   ±373.42%          20 μs          43 μs
flatbuffers_encode       39.53 K       25.30 μs   ±346.53%          21 μs         102 μs
poison_encode            18.28 K       54.71 μs   ±248.47%          51 μs          69 μs
protobuf_encode          12.65 K       79.08 μs   ±180.71%          69 μs         235 μs

Comparison: 
jiffy_encode             44.28 K
flatbuffers_encode       39.53 K - 1.12x slower
poison_encode            18.28 K - 2.42x slower
protobuf_encode          12.65 K - 3.50x slower
```

Run with `mix run bench/demo.exs`
