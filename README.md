# CS1632 D3 (Fall 2018)

CS 1632 - DELIVERABLE 3: Automated System Testing of a Web Application

## Author
* [Adam Richman](https://www.github.com/adamrichman1) (GitHub: adamrichman1)

## Project URL
- https://github.com/adamrichman1/D3

## Traceability Matrix
- Requirement #1: Test features exist
- Requirement #2: Test home page link, Test invalid url link, Test invalid parameters link, Test truth table page link
- Requirement #3: Test invalid truth symbol, Test invalid type, Default values for each parameter, Test invalid size, Test invalid false symbol, Test truth symbol == false symbol
- Requirement #4: Test valid input
- Requirement #5: Column labels correct
- Requirement #6: Truth table values correct
- Requirement #7: Default values work appropriately
- Requirement #8: Test invalid route

## Issues Completing Assignment

The only difficulty I experienced completing this assignment was understanding how to properly attach the front-end to
the back-end of the web-app. 

- Inserting variables into the .erb scripts from the back-end confused me at first because 
I originally believed the variables could simply be accessed via the params Hash. However, I learned doing this caused
the default values saved in the backend to be ignored on the front-end.

- It took me a while to understand how to call methods in the back-end (.rb) from the front-end (.erb). Once this was
understood, I didn't have any difficulty completing computational work such as comp_and, comp_or, and comp_xor.

- I originally struggled with how to display the permutations of the Truth table. Using the permutations library helped
me efficiently display the values without much code. I originally tried to create a method that would use the row and
column numbers as indexes for boolean values, but could not figure out how to enumerate the values properly.
