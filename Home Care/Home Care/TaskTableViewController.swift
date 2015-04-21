//
//  TaskTableViewController.swift
//  Home Care
//
//  Created by Tung Nguyen on 09/04/15.
//  Copyright (c) 2015 Metropolia. All rights reserved.
//

import UIKit
import Foundation

class TaskTableViewController: UITableViewController {
    var expandedSections =  NSMutableIndexSet()
    var segueShouldOccur: Bool?
    var days = [
        "Perjantai 12.8.2016\tSara M.\tSaapui: 9.03\tLähti\tAika:",
        "Torstai 11.8.2016\tSara M\tSaapui: 9.03\tLähti: 9.46\tAika: 43 min.",
        "Keskiviikko 10.8.2016\tSara M\tSaapui: 8.59\tLähti: 9.40\tAika: 41 min.",
    ]
//    var days = [String]()
    var tasks = ["Lääkkeet", "Ateriat", "Paino", "Lisätietoa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.segueShouldOccur = true
    }
    
    // MARK: - Helpers
    func tableView(tableView: UITableView, canCollapseSection section: Int) -> Bool {
        return true
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if self.tableView(tableView, canCollapseSection: section) {
            if self.expandedSections.containsIndex(section) {
                return 5
            }
            
            return 1
        }
        
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if self.tableView(tableView, canCollapseSection: indexPath.section) {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("NormalCell", forIndexPath: indexPath) as! UITableViewCell
                cell.textLabel?.text = self.days[indexPath.section]
                
                if self.expandedSections.containsIndex(indexPath.section) {
                    cell.accessoryView = MSCellAccessory(type: FLAT_FOLD_INDICATOR, color: UIColor(red: 0/255.0, green: 123/255.0, blue: 170/255.0, alpha: 1.0))
                } else {
                    cell.accessoryView = MSCellAccessory(type: FLAT_UNFOLD_INDICATOR, color: UIColor(red: 0/255.0, green: 123/255.0, blue: 170/255.0, alpha: 1.0))
                }
                
                return cell
            } else if indexPath.row == 1 || indexPath.row == 2 {
                let cell = tableView.dequeueReusableCellWithIdentifier("NormalCell", forIndexPath: indexPath) as! NormalTableViewCell
                cell.name.text = self.tasks[indexPath.row-1]
                cell.option.selectedSegmentIndex = 2
                
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCellWithIdentifier("WeightCell", forIndexPath: indexPath) as! WeightTableViewCell
                cell.name.text = self.tasks[indexPath.row-1]
                cell.weight.text = "50"
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("AdditionalCell", forIndexPath: indexPath) as! AdditionalTableViewCell
                cell.name.text = self.tasks[indexPath.row-1]
                cell.info.text = "Check the blood"
                
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("NormalCell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = "Normal Cell"
            
            return cell
        }
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if self.tableView(tableView, canCollapseSection: indexPath.section) {
            if indexPath.row == 0 {
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                let section = indexPath.section
                let currentlyExpanded = self.expandedSections.containsIndex(section)
                var rows: Int?
                var tmpArray = [NSIndexPath]()
                
                if currentlyExpanded {
                    rows = self.tableView(tableView, numberOfRowsInSection: section)
                    self.expandedSections.removeIndex(section)
                } else {
                    self.expandedSections.addIndex(section)
                    rows = self.tableView(tableView, numberOfRowsInSection: section)
                }
                
                for (var i = 1; i < rows; i++) {
                    let tmpIndexPath = NSIndexPath(forRow: i, inSection: section)
                    tmpArray.append(tmpIndexPath)
                }
                
                var cell = tableView.cellForRowAtIndexPath(indexPath)!
                
                if currentlyExpanded {
                    self.tableView.deleteRowsAtIndexPaths(tmpArray, withRowAnimation: UITableViewRowAnimation.Top)
                    cell.accessoryView = MSCellAccessory(type: FLAT_UNFOLD_INDICATOR, color: UIColor(red: 0/255.0, green: 123/255.0, blue: 170/255.0, alpha: 1.0))
                } else {
                    self.tableView.insertRowsAtIndexPaths(tmpArray, withRowAnimation: UITableViewRowAnimation.Top)
                    cell.accessoryView = MSCellAccessory(type: FLAT_FOLD_INDICATOR, color: UIColor(red: 0/255.0, green: 123/255.0, blue: 170/255.0, alpha: 1.0))
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
