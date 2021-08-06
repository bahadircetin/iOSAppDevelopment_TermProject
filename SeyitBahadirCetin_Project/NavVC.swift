//
//  NavVC.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 24.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit

enum Controller: Int {
    case one=1, two
}

class NavVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labelToChange: UILabel!
    var controller = Controller.one
   
    @IBOutlet weak var segmentCont: UISegmentedControl!
    @IBOutlet var backgroundView: UIView!
    
    @IBAction func unwindToStart(_ segue: UIStoryboardSegue){
       
   }

    @IBAction func onChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
               case 0:
                   imgView.image = UIImage(named: "hotel")
                   labelToChange.text = "Long Press to Select Your Hotel"
                   controller = Controller.one
                   backgroundView.backgroundColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
                   labelToChange.textColor = #colorLiteral(red: 0.9100623727, green: 0.902897656, blue: 0.8485912681, alpha: 1)
                   segmentCont.selectedSegmentTintColor = #colorLiteral(red: 0.1297211051, green: 0.8099016547, blue: 0.7752210498, alpha: 1)
               case 1:
                   imgView.image = UIImage(named: "plan")
                   labelToChange.text = "Long Press to Plan Your Holiday"
                   controller = Controller.two
                   backgroundView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                   labelToChange.textColor = #colorLiteral(red: 0.1720604897, green: 0.1167794839, blue: 0.4186245501, alpha: 1)
                   segmentCont.selectedSegmentTintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
               default:
                   break
               }
    }

    
    @IBAction func longPressTrigger(_ sender: UILongPressGestureRecognizer) {
        switch (controller) {
        case .one:
            self.performSegue(withIdentifier: "hotelBrowse", sender: self)
        case .two:
            self.performSegue(withIdentifier: "planHoliday", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
