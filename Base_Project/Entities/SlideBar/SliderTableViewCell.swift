//
//  SliderTableViewCell.swift
//  Booking_system
//
//  Created by Tops on 4/22/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var imgIcon:UIImageView!
    @IBOutlet weak var imgArrow:UIImageView!
    @IBOutlet weak var imgBGselected:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        if selected == true {
            imgBGselected.hidden = false
        }
        else {
            imgBGselected.hidden = true
        }
    }
    
}
