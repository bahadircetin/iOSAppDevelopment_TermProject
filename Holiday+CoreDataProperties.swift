//
//  Holiday+CoreDataProperties.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 24.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//
//

import Foundation
import CoreData


extension Holiday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Holiday> {
        return NSFetchRequest<Holiday>(entityName: "Holiday")
    }

    @NSManaged public var city: String?
    @NSManaged public var date: String?
    @NSManaged public var hotel_name: String?
    @NSManaged public var person_count: Int32

}
