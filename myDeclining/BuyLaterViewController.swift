//
//  BuyLaterViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 1/20/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit
import Firebase


class BuyLaterViewController: UIViewController {
	
//	@IBAction func backToLocationDetail(segue: UIStoryboardSegue){
//		
//	}
	@IBOutlet weak var testLabel: UILabel!
	
	@IBAction func saveButton(sender: UIButton) {
		let currentUser = FIRAuth.auth()?.currentUser
		let rootRef = FIRDatabase.database().reference()
		let otherUser = "5Mm5r7LQzHe9qT1LFp3sbtAnLYJ3"
		let messageRef1 = rootRef.child("messages/\(currentUser!.uid)/\(otherUser)").childByAutoId()
		let messageRef2 = rootRef.child("messages/\(otherUser)/\(currentUser!.uid)").childByAutoId()
		let message = [
			"senderId": currentUser!.uid,
			"text": "DANKMEMES"
		]
		messageRef1.setValue(message)
		messageRef2.setValue(message)
	}
	
	override func viewDidLoad() {
		if let currentUser = FIRAuth.auth()?.currentUser{
			testLabel.text = currentUser.uid
		}else{
			let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
			self.presentViewController(viewController, animated: true, completion: nil)
		}
		
	}
}
