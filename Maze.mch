/* Maze
 * Author: venoli
 * Creation date: 12/19/2019
 */
MACHINE
    Maze

 CONSTANTS
    GRID,SHADED,POSIBLECCELLS,EXIT,START
     
 PROPERTIES
    
     GRID : POW (NATURAL1 * NATURAL1)  & 
     GRID = { xx, yy | xx : NATURAL1 & yy : NATURAL1 & xx <= 7 & yy <= 5 } & 
     SHADED <:{ xx, yy | xx : NATURAL1 & yy : NATURAL1 & xx <= 7 & yy <= 5 } &
     SHADED = { (2|->1), (6|->1), (4|->2),(6|->2), (1|->3), (2|->3),(3|->3), (4|->3),                         (4|->4),(6|->4), (7|->4) ,(2|->5)} &    
     POSIBLECCELLS = GRID-SHADED &
     EXIT : POSIBLECCELLS & EXIT = (1|->5) &
     START : POSIBLECCELLS & START = (1|->1)
  SETS   
 
    ANSWERS = {Yes, No}
    
     
 VARIABLES
    cell, visited
 
INVARIANT
    cell : POSIBLECCELLS &
    visited : seq(INTEGER * INTEGER)
    
INITIALISATION
    cell, visited := START,[]
OPERATIONS
    changeData(currentCell)=
    PRE currentCell:POSIBLECCELLS
    THEN
        cell := currentCell||
        visited := visited <- (cell)
    END;
        
 
 position  <-- getPosition  =
   BEGIN 
       position := cell
   END;
   
   
    isExit  <-- foundExit  =
   IF
       (cell=EXIT)
   THEN
       isExit := Yes
   ELSE
       isExit := No
   END;

isVisited  <-- visitedSquare(isVisitedX,isVisitedY) =
PRE 
   isVisitedX :dom(POSIBLECCELLS) & isVisitedY :ran(POSIBLECCELLS) &
   (isVisitedX|->isVisitedY):POSIBLECCELLS
THEN
    IF((isVisitedX|->isVisitedY):ran(visited))
    THEN
      isVisited := Yes
  ELSE
      isVisited := No
      END
        
END;


route  <-- robotsRoute =
   BEGIN 
       route := visited
   END




END

