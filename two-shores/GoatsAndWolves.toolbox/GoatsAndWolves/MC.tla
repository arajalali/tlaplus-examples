---- MODULE MC ----
EXTENDS GoatsAndWolves, TLC

\* CONSTANT definitions @modelParameterConstants:0Wolves
const_170716934472947000 == 
{"wolf"}
----

\* CONSTANT definitions @modelParameterConstants:1Goats
const_170716934472948000 == 
{"goat1"}
----

\* CONSTANT definitions @modelParameterConstants:2Cabbages
const_170716934472949000 == 
{"cabbage"}
----

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_170716934472951000 ==
~AllOnShore2
----
=============================================================================
\* Modification History
\* Created Mon Feb 05 22:42:24 CET 2024 by arash
