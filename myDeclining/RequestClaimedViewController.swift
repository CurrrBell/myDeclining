//
//  RequestClaimedViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 2/11/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit

class RequestClaimedViewController: UIViewController {
	
	var name = "ERR"
	var sellerId = "ERR"
	var requestId = "ERR"

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var profilePic: UIImageView!
	
	@IBAction func confirm(sender: UIButton) {
		
		/*


		all needs to go



		*/
		
	}
	@IBAction func decline(sender: UIButton) {
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		nameLabel.text = name

        // Do any additional setup after loading the view.
    }

	

}
