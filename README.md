# JsonVsProtoDemo
Super quick benchmark to compare serialization/deserialization performance between Protobuf and JSON in Elixir.

Results on my machine: ```
Protobuf encoded size: 300
JSON encoded size: 603
Operating System: Linux
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 15.52 GB
Elixir 1.6.2
Erlang 20.0
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
parallel: 8
inputs: none specified
Estimated total run time: 21 s


Benchmarking jiffy...
Benchmarking poison...
Benchmarking protobuf...

Name               ips        average  deviation         median         99th %
jiffy          19.86 K       50.35 μs    ±55.34%          49 μs          79 μs
poison          9.71 K      103.02 μs    ±44.33%         102 μs         114 μs
protobuf        6.38 K      156.74 μs    ±44.79%         154 μs         193 μs

Comparison: 
jiffy          19.86 K
poison          9.71 K - 2.05x slower
protobuf        6.38 K - 3.11x slower
```


Run with `mix run bench/demo.exs`
