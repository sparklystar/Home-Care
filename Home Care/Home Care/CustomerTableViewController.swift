//
//  CustomerTableViewController.swift
//  Home Care
//
//  Created by Tung Nguyen on 12/04/15.
//  Copyright (c) 2015 Metropolia. All rights reserved.
//

import UIKit

class CustomerTableViewController: UITableViewController {
    let times = [
        "8:00-8.45",
        "9.00-9.45",
        "10.00-10.45",
        "11.00-11.45",
        "12.00-12.45",
        "13.00-13.45",
        "14.00-14.45",
    ]
    
    let names = [
        "Jokinen Pirkko",
        "Hollo Terhi",
        "Lindström Isto",
        "Hirvelä Annukka",
        "Haapasalo Tapani",
        "Kalliomäki Aili",
        "Saariaho Jouko",
    ]
    
    let addresses = [
        "Kuusitie 8 B 6, 00100 Helsinki",
        "Rauhankatu 84 A 1, 00800 Helsinki",
        "Hillerikuja 6 A 4, 00800 Helsinki",
        "Peuratie 12 C 3, 00800 Helsinki",
        "Susikuja 2 D 31, 00800 Helsinki",
        "Majavatie 3 D 25, 00800 Helsinki",
        "Ilvestie 4 C 34, 00800 Helsinki",
    ]
    
//    var patients = [
//        "8:00-8.45 Jokinen, Pirkko - Kuusitie 8 B 6, 00100 Helsinki",
//        "9.00-9.45 Hollo, Terhi - Rauhankatu 84 A 1, 00800 Helsinki",
//        "10.00-10.45 Lindström, Isto - Hillerikuja 6 A 4, 00800 Helsinki",
//        "11.00-11.45 Hirvelä, Annukka - Peuratie 12 C 3, 00800 Helsinki",
//        "12.00-12.45 Haapasalo, Tapani - Susikuja 2 D 31, 00800 Helsinki",
//        "13.00-13.45 Kalliomäki, Aili - Majavatie 3 D 25, 00800 Helsinki",
//        "14.00-14.45 Saariaho, Jouko - Ilvestie 4 C 34, 00800 Helsinki",
//    ]

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
        return times.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MasterTableViewCell

        cell.time.text = times[indexPath.row]
        cell.name.text = names[indexPath.row]
        cell.address.text = addresses[indexPath.row]

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
