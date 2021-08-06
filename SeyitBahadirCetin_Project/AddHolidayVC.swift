//
//  AddHolidayVC.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 24.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit

protocol AddControllerDelegate {
    func addControllerDidFinish(controller: AddHolidayVC, text: (city: String, date: String, hotel_name: String, person_count: Int32))
}


class AddHolidayVC: UIViewController {

    var delegate: AddControllerDelegate?
    
    @IBOutlet weak var personTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var hotelNameTF: UITextField!
    
    var hotelName = ""
    var city = ""
    var date = ""
    var personCount = 0
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        if (hotelNameTF.text!.isEmpty || cityTF.text!.isEmpty || dateTF.text!.isEmpty || personTF.text!.isEmpty) {
                 let mAlert = UIAlertController(title: "Entered Data", message: "TextFields cannot be empty", preferredStyle: .alert)
                 mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                 self.present(mAlert, animated: true, completion: nil)
             }
             else {
                 if let tempDelegate = delegate {
                     hotelName = hotelNameTF.text!
                     city = cityTF.text!
                     date = dateTF.text!
                    personCount = Int(personTF.text!)!
                    tempDelegate.addControllerDidFinish(controller: self, text: (city, date, hotelName, Int32(personCount)))
                 }
             }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
    
    func assignbackground(){
            let background = UIImage(named: "addPlan")
    
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleToFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
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
