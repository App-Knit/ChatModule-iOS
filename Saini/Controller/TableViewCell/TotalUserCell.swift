//
//  TotalUserCell.swift
//  Saini
//
//  Created by Rohit Saini on 06/09/18.
//  Copyright © 2018 SainiSaab. All rights reserved.
//

import UIKit

class TotalUserCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profilePic: RoundedImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
