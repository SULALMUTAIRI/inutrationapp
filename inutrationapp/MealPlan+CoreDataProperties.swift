//
//  MealPlan+CoreDataProperties.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//
//

import Foundation
import CoreData


extension MealPlan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealPlan> {
        return NSFetchRequest<MealPlan>(entityName: "MealPlan")
    }

    @NSManaged public var mealID: Int32
    @NSManaged public var calorie: Int32
    @NSManaged public var breakfast: String?
    @NSManaged public var lunch: String?
    @NSManaged public var dinner: String?
    @NSManaged public var snack: String?

}
