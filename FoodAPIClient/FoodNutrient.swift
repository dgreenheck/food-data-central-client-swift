//
//  FoodNutrient.swift
//  FoodAPIClient
//
//  Created by Daniel Greenheck on 4/11/20.
//  Copyright © 2020 Max Q Software LLC. All rights reserved.
//

import Foundation


public struct FoodNutrient {
    public var derivationCode: String?
    public var derivationDescription: String?
    public var nutrientID: Int?
    public var nutrientName: String?
    public var nutrientNumber: Int?
    public var unitName: String?
    public var value: Double?
    
    public var description: String {
        var result = ""
        
        var displayName = ""
        switch nutrientName {
        case "Energy":
            displayName = "Calories"
        case "Total lipid (fat)":
            displayName = "Fat"
        case "Protein":
            displayName = "Protein"
        case "Carbohydrate, by difference":
            displayName = "Carbohydrates"
        default:
            fatalError()
        }
        result += "\t\(displayName): \(value ?? 0) \(unitName ?? "unitless")\n"
        return result
    }
    
    public init(from data: [String:Any]) {
        self.derivationCode = data[FCKey.NutrientDerivationCode] as? String
        self.derivationDescription = data[FCKey.NutrientDerivationDescription] as? String
        self.nutrientID = data[FCKey.NutrientId] as? Int
        self.nutrientName = data[FCKey.NutrientName] as? String
        self.nutrientNumber = data[FCKey.NutrientNumber] as? Int
        self.unitName = data[FCKey.NutrientUnitName] as? String
        self.value = data[FCKey.NutrientValue] as? Double
    }
}
