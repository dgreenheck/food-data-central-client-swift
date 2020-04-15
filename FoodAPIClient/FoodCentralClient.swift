//
//  FoodCentralClient.swift
//  FoodAPIClient
//
//  Created by Daniel Greenheck on 4/13/20.
//  Copyright © 2020 Max Q Software LLC. All rights reserved.
//

import Foundation

public class FoodCentralClient {

    // dgreenheck@gmail.com
    private static let apiKey = "74AN9XefbiF3GBbEIpUMI5y4nIbioufFrvrWv2bJ"

    // URL for USDA Food Central website
    private static let apiSearchEndpoint = URL(string: "https://api.nal.usda.gov/fdc/v1/foods/search/")!
    
    /// Search the USDA FoodCentral database for the food
    /// - parameter foodSearch: The name of the food to search for
    /// - parameter brandSearch: The brand of the food to search for
    /// - parameter numberOfResults: The number of results to return
    public static func search(foodSearch: String, brandSearch: String = "", numberOfResults: Int, _ completionHandler: @escaping ([Food]?) -> Void) {
        
        guard !foodSearch.isEmpty else {
            completionHandler(nil)
            return
        }
        
        var request = URLRequest(url: apiSearchEndpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        request.httpBody = formSearchHTTPBody(foodSearch: foodSearch, numberOfResults: numberOfResults, brandSearch: brandSearch)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                print("Expected HTTPURLResponse")
                return
            }
            
            guard response.statusCode == 200 else {
                print("HTTP Error \(response.statusCode): \(response)")
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                    if let jsonFoods = json[FCKey.Foods] as? [[String: Any]] {
                        // Add foods to a set, only keeping the unique foods to prevent duplicates
                        var uniqueFoods = Set<Food>()
                        for item in jsonFoods {
                            let food = Food(from: item)
                            if !uniqueFoods.contains(food) {
                                uniqueFoods.insert(food)
                            }
                        }
                        
                        let sortedFoods = uniqueFoods.sorted(by: {(foodA,foodB) in
                            return foodA.score! > foodB.score!
                        })
                        
                        completionHandler(sortedFoods)
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    private static func formSearchHTTPBody(foodSearch: String, numberOfResults: Int, brandSearch: String = "") -> Data? {
        let parameterDictionary: [String: Any] = [
          "query": conditionSearchString(foodSearch),
          "dataType": ["Foundation", "Survey (FNDDS)", "SR Legacy", "Branded"],
          "pageSize": numberOfResults,
          "brandOwner": brandSearch
        ]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: [.sortedKeys]) else {
            print("Unable to serialize parameterDictionary to JSON")
            return nil
        }
        
        return httpBody
    }
    
    /// Conditions the search to require all search words be included
    private static func conditionSearchString(_ searchString: String) -> String {
        let searchWords = searchString.components(separatedBy: CharacterSet.punctuationCharacters.union(CharacterSet.whitespaces))
        var conditionedSearchString = ""
        for word in searchWords {
            conditionedSearchString += "+\(word) "
        }
        return conditionedSearchString
    }
}
