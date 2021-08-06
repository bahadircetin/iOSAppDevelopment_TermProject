//
//  DataSource.swift
//  CTIS480_Spr2021_HW3
//
//  Created by Syed Ali on 4/22/21.
//  Copyright © 2021 CTIS. All rights reserved.
//

import Foundation

class DataSource {
    var mRecordList: [Record] = []
    var categories: [String] = []
    
    func numbeOfItemsInEachCategory(index: Int) -> Int {
        return itemsInCategory(index: index).count
    }
    
    func numberOfCategories() -> Int {
        return categories.count
    }
    
    func getCategoryLabelAtIndex(index: Int) -> String {
        return categories[index]
    }
    
    // MARK:- Populate Data from files
    
    func populate(type: String) {
        
        if type.lowercased() == "json" {
            if let path = Bundle.main.path(forResource: "hotels", ofType: "json") {
                if let jsonToParse = NSData(contentsOfFile: path) {
                    
                    // https://www.dotnetperls.com/guard-swift
                    guard let json = try? JSON(data: jsonToParse as Data) else {
                        print("Error with JSON")
                        return
                    }
                
                    let total = json["items"].count
                
                    for index in 0..<total {
                        
                        if let category = json["items"][index]["category"].string,
                           let name = json["items"][index]["name"].string,
                           let description = json["items"][index]["description"].string,
                           let image = json["items"][index]["image"].string,
                            let rating = json["items"][index]["rating"].string
                        {
                            let record = Record(name: name, category: category, description: description, image: image, rating: rating )
                            mRecordList.append(record)
                            
                            if !categories.contains(category){
                                categories.append(category)
                            }
                            
                        }
                        
                    }
                    
                }
                else {
                    print("NSData error")
                }
            }
            else {
                print("Path error")
            }
        }
    }
    
    // MARK:- itemsForEachGroup
    func itemsInCategory(index: Int) -> [Record] {
        let item = categories[index]
        
        // See playground6 for Closure
        // http://locomoviles.com/uncategorized/filtering-swift-array-dictionaries-object-property/
        
        let filteredItems = mRecordList.filter { (record: Record) -> Bool in
            return record.category == item
        }
        
        return filteredItems
    }
    
}
