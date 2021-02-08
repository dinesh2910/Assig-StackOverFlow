//
//  CustomTableviewCell.swift
//  Assg-StackOverFlow
//
//  Created by Dinesh Danda on 2/8/21.
//  Copyright © 2021 Dinesh Danda. All rights reserved.
//

import UIKit

class CustomTableviewCell: UITableViewCell {

    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var displayName: UILabel!
    @IBOutlet var acceptanceRate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
