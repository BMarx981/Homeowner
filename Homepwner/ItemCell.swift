//
//  ItemCell.swift
//  Homepwner
//
//  Created by Marx, Brian on 2/19/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        
        valueLabel.adjustsFontForContentSizeCategory = true
    }
}
