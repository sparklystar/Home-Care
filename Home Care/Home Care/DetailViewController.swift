//
//  DetailViewController.swift
//  Home Care
//
//  Created by Tung Nguyen on 25/03/15.
//  Copyright (c) 2015 Metropolia. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: String? {
        didSet {
            // Update the view.
//            self.configureView()
        }
    }
    
    var patients = [
        "9:00 Emmanuel Marvin 123456-123X - 42 Main street, Central, IN 47110",
        "10:00 Emmanuel Marvin 123456-123X - 42 Main street, Central, IN 47110",
        "11:00 Emmanuel Marvin 123456-123X - 42 Main street, Central, IN 47110",
        "12:00 Emmanuel Marvin 123456-123X - 42 Main street, Central, IN 47110",
        "13:00 Emmanuel Marvin 123456-123X - 42 Main street, Central, IN 47110",
        "14:00 Emmanuel Marvin 123456-123X - 42 Main street, Central, IN 47110",
        "15:00 Emmanuel Marvin 123456-123X - 42 Main street, Central, IN 47110",
    ]

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: String? = self.detailItem {
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        if detailItem == "Todays's patients" {
            let task = patients[indexPath.row] as String
            cell.textLabel!.text = task
//            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        
//        if cell!.accessoryType == UITableViewCellAccessoryType.None {
//            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
//        } else {
//            cell!.accessoryType = UITableViewCellAccessoryType.None
//        }
    }
}

