//
//  PlanHolidayVC.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 24.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit
import CoreData

class PlanHolidayVC: UIViewController, UITableViewDataSource, UITableViewDelegate, AddControllerDelegate {
    
    var mHoliday = [Holiday]()
    @IBOutlet weak var mTableView: UITableView!
    
    func addControllerDidFinish(controller: AddHolidayVC, text: (city: String, date: String, hotel_name: String, person_count: Int32)) {
        self.saveNewItem(text.hotel_name, city: text.city, date: text.date, person_count: text.person_count)
        
        // Reloads the rows and sections of the table view.
        self.mTableView.reloadData()
        
        // Pops the top view controller from the navigation stack and updates the display
        controller.navigationController?.popViewController(animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            let vc = segue.destination as! AddHolidayVC
            vc.delegate = self
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mHoliday.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Recommended way
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomHotelTableViewCell
        
        // Get the Student for this index
        let holiday = mHoliday[indexPath.row]
        
        if holiday.city!.lowercased() == "izmir"{
            cell.imgView.image = UIImage(named: "izmir")
        }
        else if holiday.city!.lowercased() == "antalya" {
            cell.imgView.image = UIImage(named: "antalya")
        }
        else {
            cell.imgView.image = UIImage(named: "aydin")
        }
        
        cell.hotelName?.text = "\(indexPath.row)"
        cell.hotelName?.text = holiday.hotel_name!
        
        cell.cityDate?.text! = holiday.city! + " " + holiday.date!
        
        
        return cell
    }
    
  
    
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          
          let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
          
          if(editingStyle == .delete ) {
              // Find the Student object the user is trying to delete
              let holidayToDelete = mHoliday[indexPath.row]
              
              // Delete it from the managedObjectContext
              context.delete(holidayToDelete)
              
              // Delete it from mStudent Array
              mHoliday.remove(at: indexPath.row)
              
              // Tell the table view to animate out that row
              mTableView.deleteRows(at: [indexPath], with: .automatic)
              
              save()
          }
      }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40.0
       }
    
    // Our function to fetch data from Core Data
    func fetchData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Holiday")
        
        
        // property of the Core Data object
        let sortDescriptor1 = NSSortDescriptor(key: "hotel_name", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor1]
        
        do {
            let results = try context.fetch(fetchRequest)
            mHoliday = results as! [Holiday]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    // Method to save the Data in Core Data
    func save() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func saveNewItem(_ hotel_name : String,  city : String, date: String, person_count: Int32) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Create the new Holiday item
        let newHolidayItem = Holiday.createInManagedObjectContext(context, city: city, date: date , hotel_name: hotel_name, person_count: NSNumber(value: person_count))
        
        // Update the array containing the table view row data
        self.fetchData()
        
        if let newHolidayIndex = mHoliday.firstIndex(of: newHolidayItem) {
            // Create an NSIndexPath from the newStudentIndex
            let newHolidayItemIndexPath = IndexPath(row: newHolidayIndex, section: 0)
            // Animate in the insertion of this row
            mTableView.insertRows(at: [ newHolidayItemIndexPath ], with: .automatic)
            
            save()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.fetchData()
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
