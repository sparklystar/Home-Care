//
//  ActivitiesTableViewController.swift
//  Home Care
//
//  Created by Tung Nguyen on 13/04/15.
//  Copyright (c) 2015 Metropolia. All rights reserved.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {
    var activities = ["Tehtävät", "Huomiot", "Hoitosuunnitelma", "Lääkelista", "Kuvat"]
    var days = [
        "Perjantai 12.8.2016\t\tSara M.\t\tSaapui: 9.03\t\tLähti\t\tAika:",
        "Torstai 11.8.2016\t\tSara M.\t\tSaapui: 9.03\t\tLähti: 9.46\t\tAika: 43 min.",
        "Keskiviikko 10.8.2016\t\tSara M.\t\tSaapui: 8.59\t\tLähti: 9.40\t\tAika: 41 min.",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.activities.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = activities[indexPath.row]

        return cell
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        let taskVC = segue.destinationViewController.topViewController as! TaskTableViewController
        taskVC.days = self.days
        // Pass the selected object to the new view controller.
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow() {
//                var selectedCell = self.tableView.cellForRowAtIndexPath(indexPath)
//                println(selectedCell?.textLabel?.text)
//                let task = tasks[indexPath.row] as String
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
//                controller.delegate = self
//                controller.detailItem = task
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
    }

}
