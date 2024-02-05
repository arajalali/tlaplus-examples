---- MODULE MC ----
EXTENDS GoatsAndWolves, TLC

\* CONSTANT definitions @modelParameterConstants:0Wolves
const_170713663511510000 == 
{"wolf"}
----

\* CONSTANT definitions @modelParameterConstants:1Goats
const_170713663511511000 == 
{"goat1", "goat2"}
----

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_170713663511513000 ==
~AllOnShore2
----
=============================================================================
\* Modification History
\* Created Mon Feb 05 13:37:15 CET 2024 by arash
