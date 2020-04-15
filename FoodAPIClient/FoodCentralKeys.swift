//
//  FoodCentralKeys.swift
//  FoodAPIClient
//
//  Created by Daniel Greenheck on 4/11/20.
//  Copyright © 2020 Max Q Software LLC. All rights reserved.
//

import Foundation

public class FCKey {
    public static let Foods = "foods"
}

// MARK: - Foods

extension FCKey {
    public static let AllHighlightFields = "allHighlightFields"
    public static let BrandOwner = "brandOwner"
    public static let DataType = "dataType"
    public static let Description = "description"
    public static let FDCId = "fdcId"
    public static let FoodNutrients = "foodNutrients"
    public static let UPCCode = "gtinUpc"
    public static let NBDNumber = "nbdNumber"
    public static let Ingredients = "ingredients"
    public static let PublishedDate = "publishedDate"
    public static let SearchScore = "score"
}

// MARK: - Nutrients

extension FCKey {
    public static let NutrientDerivationCode = "derivationCode"
    public static let NutrientDerivationDescription = "derivationDescription"
    public static let NutrientId = "nutrientId"
    public static let NutrientName = "nutrientName"
    public static let NutrientNumber = "nutrientNumber"
    public static let NutrientUnitName = "unitName"
    public static let NutrientValue = "value"
    
    public static let NutrientCalories = "Energy"
    public static let NutrientFat = "Total lipid (fat)"
    public static let NutrientProtein = "Protein"
    public static let NutrientCarbohydrate = "Carbohydrate, by difference"
    
    public static let Nutrients = Set([
        FCKey.NutrientCalories,
        FCKey.NutrientFat,
        FCKey.NutrientProtein,
        FCKey.NutrientCarbohydrate
    ])
}
