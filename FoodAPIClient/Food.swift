//
//  Food.swift
//  FoodAPIClient
//
//  Created by Daniel Greenheck on 4/11/20.
//  Copyright © 2020 Max Q Software LLC. All rights reserved.
//

import Foundation

public struct Food: CustomStringConvertible, Hashable {
    public var allHighlightFields: [String]?
    public var brandOwner: String?
    public var dataType: String?
    public var fdcId: Int?
    public var foodDescription: String?
    public var ingredients: String?
    public var ndbNumber: Int?
    public var nutrients: [FoodNutrient]
    public var publishedDate: String?
    public var gtinUPC: String?
    public var score: Double?
    
    public var calories: Double?
    public var fat: Double?
    public var protein: Double?
    public var carbs: Double?
    
    public var description: String {
        var result = ""
        result += " - \(foodDescription?.capitalized ?? "") (\(brandOwner?.capitalized ?? ""))\n"
        result += "    CAL: \(calories ?? 0) | F: \(fat ?? 0) | P: \(protein ?? 0) | C: \(carbs ?? 0) | Score: \(score ?? 0)"
        return result
    }
    
    public init(from json: [String:Any]) {
        self.allHighlightFields = json[FCKey.AllHighlightFields] as? [String]
        self.brandOwner = json[FCKey.BrandOwner] as? String
        self.dataType = json[FCKey.DataType] as? String
        self.fdcId = json[FCKey.FDCId] as? Int
        self.foodDescription = json[FCKey.Description] as? String
        self.ingredients = json[FCKey.Ingredients] as? String
        self.publishedDate = json[FCKey.PublishedDate] as? String
        self.gtinUPC = json[FCKey.UPCCode] as? String
        self.score = json[FCKey.SearchScore] as? Double
        
        self.nutrients = [FoodNutrient]()
        
        if let jsonNutrients = json[FCKey.FoodNutrients] as? [[String: Any]] {
            for jsonNutrient in jsonNutrients {
                // Only allow calories, fat, protein and carbs
                guard let nutrientName = jsonNutrient[FCKey.NutrientName] as? String else {
                    continue
                }
                guard let nutrientValue = jsonNutrient[FCKey.NutrientValue] as? Double else {
                    continue
                }
                
                if nutrientName == FCKey.NutrientCalories {
                    self.calories = nutrientValue
                }
                else if nutrientName == FCKey.NutrientFat {
                    self.fat = nutrientValue
                }
                else if nutrientName == FCKey.NutrientProtein {
                    self.protein = nutrientValue
                }
                else if nutrientName == FCKey.NutrientCarbohydrate {
                    self.carbs = nutrientValue
                }
            }
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.description)
        hasher.combine(self.brandOwner)
        hasher.combine(self.calories)
        hasher.combine(self.fat)
        hasher.combine(self.protein)
        hasher.combine(self.carbs)
    }
    
    public static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs.description == rhs.description &&
            lhs.brandOwner == rhs.brandOwner &&
            lhs.calories == rhs.calories &&
            lhs.fat == rhs.fat &&
            lhs.protein == rhs.protein &&
            lhs.carbs == rhs.carbs
    }
}
