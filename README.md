# JsonVsProtoDemo
Super quick/basic benchmark to compare serialization/deserialization performance between Protobuf and JSON in Elixir.

Results on my machine:
```
Erlang term_to_binary/1 size: 647 bytes
Protobuf encoded size: 300 bytes
JSON encoded size: 603 bytes
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
Estimated total run time: 28 s


Benchmarking jiffy...
Benchmarking poison...
Benchmarking protobuf...
Benchmarking term_to_binary...

Name                     ips        average  deviation         median         99th %
term_to_binary      142.24 K        7.03 μs   ±636.53%           6 μs          17 μs
jiffy                20.01 K       49.98 μs    ±33.80%          48 μs          79 μs
poison                9.82 K      101.86 μs    ±41.92%         101 μs         114 μs
protobuf              6.49 K      154.19 μs    ±62.96%         150 μs         198 μs

Comparison: 
term_to_binary      142.24 K
jiffy                20.01 K - 7.11x slower
poison                9.82 K - 14.49x slower
protobuf              6.49 K - 21.93x slower

```


Run with `mix run bench/demo.exs`
