//
//  UserSettings+CoreDataProperties.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//
//

import Foundation
import CoreData


extension UserSettings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserSettings> {
        return NSFetchRequest<UserSettings>(entityName: "UserSettings")
    }

    @NSManaged public var activityLevel: Int32
    @NSManaged public var caloieLevel: Int32
    @NSManaged public var height: Double
    @NSManaged public var mealPlan: Int32
    @NSManaged public var userID: Int32
    @NSManaged public var weight: Int32

}
