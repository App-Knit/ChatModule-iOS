//
//  ConversationCell.swift
//  Saini
//
//  Created by Rohit Saini on 03/09/18.
//  Copyright © 2018 SainiSaab. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {
    @IBOutlet weak var Username: UILabel!
    
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var profilePIc: RoundedImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
