//
//  NormalTableViewCell.swift
//  Home Care
//
//  Created by Tung Nguyen on 21/04/15.
//  Copyright (c) 2015 Metropolia. All rights reserved.
//

import UIKit

class NormalTableViewCell: UITableViewCell {
    @IBOutlet weak var isDone: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var option: UISegmentedControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
