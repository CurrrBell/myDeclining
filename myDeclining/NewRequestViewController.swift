//
//  NewRequestViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 2/7/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit

class NewRequestViewController: UIViewController {
	
	var name = "ERR"
	var buyer = "ERR"

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var profilePicture: UIImageView!
	
	@IBAction func claim(sender: UIButton) {
		
		/*




		refactor




		*/
		nameLabel.text = buyer
//		let seller = PFInstallation.currentInstallation()["userId"]
//		
//		PFCloud.callFunctionInBackground("claimRequest", withParameters: ["buyer": buyer, "seller": seller]) {
//			(response: AnyObject?, error: NSError?) -> Void in
//			if let _: [String: String] = response as? [String: String] {
//				//				self.testLabel.text = "This executed"
//				//				self.testLabel.text = response!["username"] as? String
//			}
//		}
		
////		let userQuery = PFUser.query()
////		userQuery!.whereKey("objectId", equalTo: buyer)
////		let query = PFInstallation.query()
////		query!.whereKey("user", matchesQuery: userQuery!)
//		let push = PFPush()
//		//push.setQuery(query) // Set our Installation query
//		push.setChannel("Pit")
//		push.setMessage("Free hotdogs at the Parse concession stand!")
//		push.sendPushInBackground()
	}
	
	@IBAction func cancel(sender: UIButton) {
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		nameLabel.text = name
	}
}
