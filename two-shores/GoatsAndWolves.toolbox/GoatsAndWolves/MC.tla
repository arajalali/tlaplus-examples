---- MODULE MC ----
EXTENDS GoatsAndWolves, TLC

\* CONSTANT definitions @modelParameterConstants:0Wolves
const_170713719225618000 == 
{"wolf"}
----

\* CONSTANT definitions @modelParameterConstants:1Goats
const_170713719225619000 == 
{"goat1", "goat2"}
----

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_170713719225621000 ==
~AllOnShore2
----
=============================================================================
\* Modification History
\* Created Mon Feb 05 13:46:32 CET 2024 by arash
