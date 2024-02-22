This is the spec for a minimal accounting engine which takes in new financial transactions, records them and then (in time) updates some aggregate balances based these transactions and the groupings they come with.

To model-check this spec from the command line use the following command

`java -XX:+UseParallelGC -jar ~/tools/tlaplus/tla2tools.jar MC.tla`