//
//  UserBasicProfile+CoreDataProperties.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//
//

import Foundation
import CoreData


extension UserBasicProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserBasicProfile> {
        return NSFetchRequest<UserBasicProfile>(entityName: "UserBasicProfile")
    }

    @NSManaged public var dob: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var password: String?

}
