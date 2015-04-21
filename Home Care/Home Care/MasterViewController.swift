//
//  MasterViewController.swift
//  Home Care
//
//  Created by Tung Nguyen on 25/03/15.
//  Copyright (c) 2015 Metropolia. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, DetailViewControllerDelegate {

    var detailViewController: DetailViewController? = nil
    var tasks = ["Asiakkaat", "Lisää asiakkaita", "Lue QR-koodi", "Asetukset"]

    override func awakeFromNib() {
        super.awakeFromNib()
        self.clearsSelectionOnViewWillAppear = false
        self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        self.title = "Sara Mäki"
        
        let controllers = self.splitViewController!.viewControllers
        self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
        self.detailViewController?.delegate = self
        self.detailViewController?.detailItem = "Asiakkaat"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customerHasBeenChosen(chosen: Bool) {
        if chosen == true {
            self.tasks = ["Jokinen, Pirkko\n123456-123X\nKuusitie 8\n00100 Helsinki", "Tehtävät", "Huomiot", "Hoitosuunnitelma", "Lääkelista", "Kuvat"]
        } else {
            self.tasks = ["Asiakkaat", "Lisää asiakkaita", "Lue QR-koodi", "Asetukset"]
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func goHome(sender: UIBarButtonItem) {
        tasks = ["Asiakkaat", "Lisää asiakkaita", "Lue QR-koodi", "Asetukset"]
        self.tableView.reloadData()
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
//                var selectedCell = self.tableView.cellForRowAtIndexPath(indexPath)
//                println(selectedCell?.textLabel?.text)
                let task = tasks[indexPath.row] as String
                
                if task == "Asiakkaat" {
                    let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                    controller.delegate = self
                    controller.detailItem = task
                    controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    controller.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)as! UITableViewCell

        let task = tasks[indexPath.row] as String
        cell.textLabel!.text = task
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    

//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            tasks.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

