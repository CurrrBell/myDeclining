//
//  ProfileCell.swift
//  myDeclining
//
//  Created by Christopher Bell on 2/15/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

	@IBOutlet weak var profilePic: UIImageView!
	@IBOutlet weak var name: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


//wtf is this?