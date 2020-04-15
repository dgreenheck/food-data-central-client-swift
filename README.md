# food-data-central-client-swift
Swift terminal application which allows you to search for foods in the USDA FoodCentral database. Outputs a variable number of results display the following
* Description
* Brand
* Calories (I believe this defaults to 100g/100mL units)
* Fat
* Protein
* Carbs

## Known Issues
The app works as expected but the quality of the search results are less than desireable. Since there isn't a popularity score associated with a certain food, the top result is usually an irrelevant food. For example, if you are searching for something generic like "apple", the top five results are
* Crisp, Apple, Apple Dessert
* Apple, Candied
* Apple Chips
* Apple, Fried
* Apple Cider


## References

  [1] [FoodData Central API Documentation](https://fdc.nal.usda.gov/api-guide.html)
  
## Example output

```
Enter food to search for: cheddar cheese
Enter brand to search for: sargento
Please wait...

 - 2 Cheese Cheddar Slices, 2 Cheese Cheddar (Sargento Foods Inc)
    CAL: 389.0 | F: 33.33 | P: 22.22 | C: 0.0 | Score: -320.75952
 - Sharp Cheddar Cheese (Sargento Foods Inc)
    CAL: 286.0 | F: 21.43 | P: 23.81 | C: 4.76 | Score: -332.86063
 - Natural Cheese Cheddar-Mozzarella Natural Cheese, Cheddar-Mozzarella (Sargento Foods Inc)
    CAL: 316.0 | F: 26.32 | P: 26.32 | C: 5.26 | Score: -342.1299
 - Mild Cheddar Shredded Natural Cheddar Cheese (Sargento Foods Inc)
    CAL: 393.0 | F: 32.14 | P: 25.0 | C: 3.57 | Score: -350.2045
 - Sharp Cheddar Shredded Natural Cheddar Cheese (Sargento Foods Inc)
    CAL: 393.0 | F: 32.14 | P: 25.0 | C: 7.14 | Score: -350.2045
    
END OF SEARCH RESULTS
```
