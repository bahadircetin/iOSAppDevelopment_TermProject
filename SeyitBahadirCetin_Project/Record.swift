//
//  Record.swift
//  CTIS480_Spr2021_HW3
//
//  Created by Syed Ali on 4/22/21.
//  Copyright © 2021 CTIS. All rights reserved.
//

import Foundation

class Record {
    var name: String
    var category: String
    var description: String
    var image: String
    var rating: String
    
    init(name: String, category: String, description: String, image: String, rating: String) {
        self.category = category
        self.name = name
        self.description = description
        self.image = image
        self.rating = rating
    }
        
}
