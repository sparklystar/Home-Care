//
//  WeightTableViewCell.swift
//  Home Care
//
//  Created by Tung Nguyen on 21/04/15.
//  Copyright (c) 2015 Metropolia. All rights reserved.
//

import UIKit

class WeightTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var weight: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
