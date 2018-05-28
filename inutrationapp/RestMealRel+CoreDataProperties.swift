//
//  RestMealRel+CoreDataProperties.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//
//

import Foundation
import CoreData


extension RestMealRel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestMealRel> {
        return NSFetchRequest<RestMealRel>(entityName: "RestMealRel")
    }

    @NSManaged public var mealID: Int32
    @NSManaged public var restID: Int32

}
