--------------------------- MODULE GoatsAndWolves ---------------------------
EXTENDS Integers, FiniteSets

CONSTANTS Goats, Wolves

VARIABLES shore1, boat, shore2, boatLocation



TypeOK == /\ shore1 \subseteq Goats \union Wolves
          /\ shore2 \subseteq Goats \union Wolves
          /\ boat \subseteq Goats \union Wolves
          /\ boatLocation \in {"shore1", "shore2"}
          /\ Cardinality(boat) =< 1
          
Init == /\ shore1 = Goats \union Wolves
        /\ shore2 = {}
        /\ boat = {}
        /\ boatLocation = "shore1"
        
Shore1ToBoat == \exists x \in shore1:  
                /\ boatLocation = "shore1"
                /\ boatLocation' = "shore1"
                /\ shore1 /= {}
                /\ boat = {}
                /\ shore1' = shore1 \ {x}
                /\ boat' = boat \union {x}            
                /\ shore2' = shore2
                
                
Shore2ToBoat == \exists x \in shore2:  
                /\ boatLocation = "shore2"
                /\ boatLocation' = "shore2"
                /\ shore2 /= {}
                /\ boat = {}                
                /\ shore2' = shore2 \ {x}
                /\ boat' = boat \union {x} 
                /\ shore1' = shore1
                
BoatToShore2 == \exists x \in boat:
                /\ boatLocation = "shore2"
                /\ boatLocation' = "shore2"
                /\ boat /= {}
                /\ boat' = boat \ {x}
                /\ shore2' = shore2 \union {x} 
                /\ shore1' = shore1
                
BoatToShore1 == \exists x \in boat:
                /\ boatLocation = "shore1"
                /\ boatLocation' = "shore1"
                /\ boat /= {}                
                /\ boat' = boat \ {x}
                /\ shore1' = shore1 \union {x} 
                /\ shore2' = shore2

SafeToLeaveShore == IF boatLocation = "shore1" THEN
                        \/ shore1 \intersect Wolves = {} 
                        \/ shore1 \intersect Goats = {}
                    ELSE 
                        \/ shore2 \intersect Wolves = {} 
                        \/ shore2 \intersect Goats = {}
                       
MoveBoat == /\ shore1' = shore1
            /\ shore2' = shore2
            /\ boat' = boat
            /\ SafeToLeaveShore
            /\ IF boatLocation = "shore1" THEN
                 boatLocation' = "shore2"    
               ELSE
                 boatLocation' = "shore1"
                 
                 
NextMove == \/ Shore1ToBoat
            \/ Shore2ToBoat    
            \/ BoatToShore1
            \/ BoatToShore2
            \/ MoveBoat                                    
           

                 
AllOnShore2 == shore2 = Goats \union Wolves  
=============================================================================
\* Modification History
\* Last modified Mon Feb 05 13:35:26 CET 2024 by arash
\* Created Mon Feb 05 13:34:31 CET 2024 by arash
