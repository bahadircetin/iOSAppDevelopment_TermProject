//
//  Holiday+CoreDataClass.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 24.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Holiday)
public class Holiday: NSManagedObject {
    
    class func createInManagedObjectContext(_ context: NSManagedObjectContext, city: String, date: String, hotel_name: String, person_count: NSNumber) -> Holiday {
        let holidayObject = NSEntityDescription.insertNewObject(forEntityName: "Holiday", into: context) as! Holiday
        holidayObject.city = city
        holidayObject.date = date
        holidayObject.hotel_name = hotel_name
        holidayObject.person_count = Int32(truncating: person_count)
    
        return holidayObject
    }
}
