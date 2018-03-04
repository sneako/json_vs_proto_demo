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
Warning: The function you are trying to benchmark is super fast, making measures more unreliable! See: https://github.com/PragTob/benchee/wiki/Benchee-Warnings#fast-execution-warning

Name                     ips        average  deviation         median         99th %
term_to_binary       92.07 K       10.86 μs  ±1642.07%           7 μs       19.70 μs
jiffy                15.62 K       64.01 μs   ±507.57%          52 μs         105 μs
poison                7.64 K      130.93 μs   ±357.42%         106 μs         218 μs
protobuf              4.75 K      210.54 μs   ±289.98%         163 μs         443 μs

Comparison: 
term_to_binary       92.07 K
jiffy                15.62 K - 5.89x slower
poison                7.64 K - 12.05x slower
protobuf              4.75 K - 19.39x slower

Benchmarking jiffy_decode...
Benchmarking poison_decode...
Benchmarking protobuf_decode...

Name                      ips        average  deviation         median         99th %
jiffy_decode          21.79 K       45.90 μs   ±606.14%          36 μs          75 μs
poison_decode         14.03 K       71.29 μs   ±542.74%          57 μs          98 μs
protobuf_decode       10.73 K       93.24 μs   ±221.09%          86 μs         126 μs

Comparison: 
jiffy_decode          21.79 K
poison_decode         14.03 K - 1.55x slower
protobuf_decode       10.73 K - 2.03x slower

Benchmarking jiffy_encode...
Benchmarking poison_encode...
Benchmarking protobuf_encode...

Name                      ips        average  deviation         median         99th %
jiffy_encode          38.48 K       25.99 μs   ±612.91%          21 μs          57 μs
poison_encode         14.62 K       68.39 μs   ±608.27%          51 μs          85 μs
protobuf_encode        9.97 K      100.32 μs   ±467.02%          69 μs         271 μs

Comparison: 
jiffy_encode          38.48 K
poison_encode         14.62 K - 2.63x slower
protobuf_encode        9.97 K - 3.86x slower

```

Run with `mix run bench/demo.exs`
