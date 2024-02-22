---- MODULE MC ----

EXTENDS AccountingEngine, TLC


const_groups == {"g1", "g2"}
const_values == {1,-1}

prop_things_will_addup ==
    <>(AEEverythingAddsUp /\ ~AEInit)
=============================================================================
