---- MODULE MC ----
EXTENDS AccountingEngine, TLC

\* CONSTANT definitions @modelParameterConstants:0Values
const_1707919722538499000 == 
{-1, 0, 1}
----

\* CONSTANT definitions @modelParameterConstants:1Groups
const_1707919722538500000 == 
{"g1", "g2"}
----

\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1707919722538502000 ==
AEAllUptoDate => \forall g \in Groups: balances[g] = AESumOf[transactions, g]
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1707919722538503000 ==
<>(AEAllUptoDate /\ ~AEInit)
----
=============================================================================
\* Modification History
\* Created Wed Feb 14 15:08:42 CET 2024 by arash
