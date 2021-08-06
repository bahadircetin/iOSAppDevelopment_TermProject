//
//  HotelDetailVC.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 25.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit

class HotelDetailVC: UIViewController {
    var myRecord: Record?
    
    @IBOutlet weak var txtView: UITextView!
   
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.layer.cornerRadius = 20
        if let tempRecord = myRecord {
            navigationItem.title = tempRecord.name.capitalized
            
            imgView.image = UIImage(named: tempRecord.image.lowercased())
            txtView.text = "Hotel's Rating is: " + tempRecord.rating + "\n\n" + tempRecord.description
        
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
