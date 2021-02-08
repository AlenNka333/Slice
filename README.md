# Slice
Pizzabot. Task is to instruct Pizzabot on how to deliver pizzas to all the houses in a neighborhood. In more specific terms, given a grid (where each point on the grid is one house) and a list of points representing houses in need of pizza delivery, return a list of instructions for getting Pizzabot to those locations and delivering. An instruction is one of:
  - N: Move north
  - S: Move south
  - E: Move east
  - W: Move west
  - D: Drop pizza
  Pizzabot always starts at the origin point, (0, 0). As with a Cartesian plane, this point lies at the most south- westerly point of the grid.
  
 ## Usage instructions: 
  To open the app go to progect folder and run the command './pizzabot "[your input string]"'. Add input string using the example "5x5 (1, 3) (4, 4)". As an answer you will get a string with path from house to house to deliver pizza, for example "ENNNDEEEND".

## Unit tests:
  Added tests to check main service and validation and parsing input data.
