--------------------------- MODULE GoatsAndWolves ---------------------------
EXTENDS Integers, FiniteSets

CONSTANTS Goats, Wolves

VARIABLES shore1, boat, shore2, boatLocation


Things == Goats \union Wolves

TypeOK == /\ shore1 \subseteq Things
          /\ shore2 \subseteq Things
          /\ boat \subseteq Things
          /\ boatLocation \in {"shore1", "shore2"}
          /\ Cardinality(boat) =< 1
          
Init == /\ shore1 = Things
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

GWSafeToLeaveShore == IF boatLocation = "shore1" THEN
                        \/ shore1 \intersect Wolves = {} 
                        \/ shore1 \intersect Goats = {}
                    ELSE 
                        \/ shore2 \intersect Wolves = {} 
                        \/ shore2 \intersect Goats = {}
                       
MoveBoat == /\ shore1' = shore1
            /\ shore2' = shore2
            /\ boat' = boat
            /\ GWSafeToLeaveShore
            /\ IF boatLocation = "shore1" THEN
                 boatLocation' = "shore2"    
               ELSE
                 boatLocation' = "shore1"
                 
                 
NextMove == \/ Shore1ToBoat
            \/ Shore2ToBoat    
            \/ BoatToShore1
            \/ BoatToShore2
            \/ MoveBoat                                    
           

                 
AllOnShore2 == shore2 = Things  


=============================================================================
\* Modification History
\* Last modified Mon Feb 05 14:51:10 CET 2024 by arash
\* Created Mon Feb 05 13:34:31 CET 2024 by arash
