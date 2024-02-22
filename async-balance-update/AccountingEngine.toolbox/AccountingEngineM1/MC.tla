---- MODULE MC ----
EXTENDS AccountingEngine, TLC

\* CONSTANT definitions @modelParameterConstants:0Values
const_1707997423160741000 == 
{-1, 1}
----

\* CONSTANT definitions @modelParameterConstants:1Groups
const_1707997423160742000 == 
{"g1", "g2"}
----

\* PROPERTY definition @modelCorrectnessProperties:0
prop_1707997423161744000 ==
<>(AEEverythingAddsUp /\ ~AEInit)
----
=============================================================================
\* Modification History
\* Created Thu Feb 15 12:43:43 CET 2024 by arash
