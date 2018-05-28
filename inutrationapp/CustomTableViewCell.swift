//
//  CustomTableViewCell.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lblSnack: UILabel!
    @IBOutlet weak var lblDinner: UILabel!
    @IBOutlet weak var lblLunch: UILabel!
    @IBOutlet weak var lblBreakfast: UILabel!
    @IBOutlet weak var customView: UIView!
    

}
