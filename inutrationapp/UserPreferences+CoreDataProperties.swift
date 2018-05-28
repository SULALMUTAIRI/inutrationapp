//
//  UserPreferences+CoreDataProperties.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//
//

import Foundation
import CoreData
extension UserPreferences {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPreferences> {
        return NSFetchRequest<UserPreferences>(entityName: "UserPreferences")
    }

    @NSManaged public var userID: Int32
    @NSManaged public var breakfast: String?
    @NSManaged public var lunch: String?
    @NSManaged public var dinner: String?
    @NSManaged public var snack: String?

}
