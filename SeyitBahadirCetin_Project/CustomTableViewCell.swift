//
//  CustomTableViewCell.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 25.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

   
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var labelV: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
