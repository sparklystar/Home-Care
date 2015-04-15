//
//  DetailViewController.swift
//  Home Care
//
//  Created by Tung Nguyen on 25/03/15.
//  Copyright (c) 2015 Metropolia. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
    func customerHasBeenChosen(chosen: Bool)
}

class DetailViewController: UITableViewController, UINavigationControllerDelegate {
    var detailItem: String? {
        didSet {
            // Update the view.
//            self.configureView()
        }
    }
    
    var patients = [
        "8:00-8.45 Jokinen, Pirkko - Kuusitie 8 B 6, 00100 Helsinki",
        "9.00-9.45 Hollo, Terhi - Rauhankatu 84 A 1, 00800 Helsinki",
        "10.00-10.45 Lindström, Isto - Hillerikuja 6 A 4, 00800 Helsinki",
        "11.00-11.45 Hirvelä, Annukka - Peuratie 12 C 3, 00800 Helsinki",
        "12.00-12.45 Haapasalo, Tapani - Susikuja 2 D 31, 00800 Helsinki",
        "13.00-13.45 Kalliomäki, Aili - Majavatie 3 D 25, 00800 Helsinki",
        "14.00-14.45 Saariaho, Jouko - Ilvestie 4 C 34, 00800 Helsinki",
    ]
    
    var delegate: DetailViewControllerDelegate?

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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.customerHasBeenChosen(false)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        if detailItem == "Asiakkaat" {
            let task = patients[indexPath.row] as String
            cell.textLabel!.text = task
//            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.customerHasBeenChosen(true)
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        
//        if cell!.accessoryType == UITableViewCellAccessoryType.None {
//            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
//        } else {
//            cell!.accessoryType = UITableViewCellAccessoryType.None
//        }
    }
}

