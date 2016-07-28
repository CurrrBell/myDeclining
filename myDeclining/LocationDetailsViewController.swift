//
//  LocationDetailsViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 1/20/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {
	
	@IBOutlet weak var testLabel: UILabel!
	
	
	@IBAction func request(sender: UIButton) {
		
		/*



		refactor



		*/
//		let installation = PFInstallation.currentInstallation()
//		let buyer = installation["userId"]
//		
//		PFCloud.callFunctionInBackground("requestDeclining", withParameters: ["location": diningHall, "user": buyer]) {
//			(response: AnyObject?, error: NSError?) -> Void in
//			if let _: [String: String] = response as? [String: String] {
////				self.testLabel.text = "This executed"
////				self.testLabel.text = response!["username"] as? String
//			}
//		}
		
		self.performSegueWithIdentifier("GoToChat", sender: nil)
	}
	
	var diningHall = "ERR"
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		let currentInstallation = PFInstallation.currentInstallation()
//		currentInstallation.addUniqueObject(diningHall, forKey: "channels")
//		currentInstallation.saveInBackground()		
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		super.prepareForSegue(segue, sender: sender)
		let chatVc = segue.destinationViewController as! ChatViewController
		chatVc.senderId = ""
		chatVc.senderDisplayName = ""
	}
}
