---- MODULE MC ----
EXTENDS GoatsAndWolves, TLC

\* CONSTANT definitions @modelParameterConstants:0Wolves
const_170714522674530000 == 
{"wolf"}
----

\* CONSTANT definitions @modelParameterConstants:1Goats
const_170714522674531000 == 
{"goat1", "goat2"}
----

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_170714522674533000 ==
~AllOnShore2
----
=============================================================================
\* Modification History
\* Created Mon Feb 05 16:00:26 CET 2024 by arash
