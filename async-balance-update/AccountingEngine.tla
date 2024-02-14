-------------------------- MODULE AccountingEngine --------------------------

EXTENDS Integers, FiniteSets, Sequences

CONSTANTS Groups, Values

VARIABLES transactions, balances, lastAppliedTransaction

ASSUME Groups \subseteq STRING
ASSUME Values \subseteq Int

AETypeOK == /\ transactions \in Seq([value: Values, group: Groups])
            /\ balances \in [Groups -> Int]
            /\ lastAppliedTransaction \in { x \in Int: x \in DOMAIN transactions \/ x = 0 }

AEInit == /\ transactions = << >>
          /\ balances = [g \in Groups |-> 0]
          /\ lastAppliedTransaction = 0

       
AENewTransaction == \exists v \in Values, g \in Groups: /\ transactions' = transactions \o << [value |-> v, group |-> g] >>
                                                        /\ Len(transactions') < 8
                                                        /\ lastAppliedTransaction' = lastAppliedTransaction
                                                        /\ balances' = balances
                                                       
AEUpdateBalance == /\ lastAppliedTransaction /= Len(transactions)  
                   /\  LET g == transactions[lastAppliedTransaction+1].group
                           v == transactions[lastAppliedTransaction+1].value IN
                           ( /\ balances' = [balances EXCEPT ![g] = balances[g] + v]
                             /\ lastAppliedTransaction' = lastAppliedTransaction + 1
                             /\ transactions' = transactions )
                                               
AENext == \/ AENewTransaction
          \/ AEUpdateBalance     


AESumOf[tx \in Seq([value: Values, group: Groups]), g \in Groups] == IF tx = << >> THEN 0 
                                                                     ELSE AESumOf[Tail(tx),g] + 
                                                                        (IF Head(tx).group = g THEN Head(tx).value ELSE 0)            

AEAllUptoDate == lastAppliedTransaction = Len(transactions)

AEBalancesOutOfDate == lastAppliedTransaction /= Len(transactions)

AEBalancesFinallyUptodate == AEBalancesOutOfDate => <>AEAllUptoDate

AEHistoryOK == []~(lastAppliedTransaction > Len(transactions))

AEEverythingAddsUp == \forall g \in Groups: AESumOf[transactions, g] = balances[g]
                      
============================================================================
\* Modification History
\* Last modified Wed Feb 14 14:56:54 CET 2024 by arash
\* Created Thu Feb 08 21:39:50 CET 2024 by arash
