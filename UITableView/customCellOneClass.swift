//
//  customCellOneClass.swift
//  UITableView
//
//  Created by Gary on 11/12/2015.
//  Copyright © 2015 from The Loft. All rights reserved.
//

import UIKit

class customCellOneClass: UITableViewCell {

    @IBOutlet weak var cellImageUIImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


