//
//  main.swift
//  FoodAPIClient
//
//  Created by Daniel Greenheck on 4/11/20.
//  Copyright © 2020 Max Q Software LLC. All rights reserved.
//

import Foundation



func runProgram() {
    print("Enter food to search for: ", separator: "", terminator: "")
    let foodSearch = readLine() ?? ""
    print("Enter brand to search for: ", separator: "", terminator: "")
    let brandSearch = readLine() ?? ""
    print("Please wait...\n\n")
    
    FoodCentralClient.search(foodSearch: foodSearch, brandSearch: brandSearch, numberOfResults: 5) {(foods) in
        guard let foods = foods else {
            print("Food search (\(foodSearch)) returned no results")
            return
        }
        
        for food in foods {
            print(food)
        }
        print("END OF SEARCH RESULTS")
        print("")
        
        runProgram()
    }
}

runProgram()
RunLoop.main.run()
