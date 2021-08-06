//
//  BrowseHotelsVC.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 25.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit

class BrowseHotelsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataSource = DataSource()
    
    @IBOutlet weak var mTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numbeOfItemsInEachCategory(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        
        let records: [Record] = dataSource.itemsInCategory(index: indexPath.section)
        let record = records[indexPath.row]
        
        cell.imgView.image = UIImage(named: record.image.lowercased())
        cell.labelV.text = record.name.capitalized
        cell.imgView.layer.cornerRadius = cell.imgView.frame.height / 2.75
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2.75;        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfCategories()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label: UILabel = UILabel()
        
        label.text = dataSource.getCategoryLabelAtIndex(index: section)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.0006931591197, green: 0.3579095602, blue: 0.3384808898, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.7575499415, green: 0.9894943833, blue: 0.965929091, alpha: 1)
        
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func getIndexPathForSelectedRow() -> IndexPath? {
        var indexP: IndexPath?
        
        if mTableView.indexPathsForVisibleRows!.count > 0 {
            indexP = mTableView.indexPathsForSelectedRows![0] as IndexPath
        }
        return indexP
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hotelDetail" {
            if let indexPath = getIndexPathForSelectedRow(){
                let record = dataSource.itemsInCategory(index: indexPath.section)[indexPath.row]
                
                let detailVC = segue.destination as! HotelDetailVC
                detailVC.myRecord = record
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.populate(type: "json")
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
