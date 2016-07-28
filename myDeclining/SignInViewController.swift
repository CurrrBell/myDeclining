//
//  SignInViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 1/24/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
	
	var validCredentials:Bool = false
	
	@IBOutlet weak var emailTextBox: UITextField!
	@IBOutlet weak var passwordTextBox: UITextField!
	@IBOutlet weak var invalidCredentialsLabel: UILabel!
	
	@IBAction func logIn(sender: UIButton) {
		let email = self.emailTextBox.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
		let password = self.passwordTextBox.text
		
		// Validate the text fields
		if !isValidEmail(email) {
			invalidCredentialsLabel.text = "Please enter a valid Rochester.edu email address"
			invalidCredentialsLabel.hidden = false
			
		}
		
			
		else {
			
			/*





			refactor 





			*/
			
			
			// Run a spinner to show a task in progress
			let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
			spinner.startAnimating()
			
			FIRAuth.auth()?.signInWithEmail(email, password: password!) { (user, error) in
				spinner.stopAnimating()
				
				let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Nav")
				self.presentViewController(viewController, animated: true, completion: nil)
				
				
			}
			
//			// Send a request to login
//			PFUser.logInWithUsernameInBackground(email, password: password!, block: { (user, error) -> Void in
//				
//				// Stop the spinner
//				spinner.stopAnimating()
//				
//				if ((user) != nil) {
//					
//					dispatch_async(dispatch_get_main_queue(), { () -> Void in
//						let installation = PFInstallation.currentInstallation()
//						installation["user"] = PFUser.currentUser()
//						installation["userId"] = PFUser.currentUser()!.objectId
//						installation.saveInBackground()
//						let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Nav")
//						self.presentViewController(viewController, animated: true, completion: nil)
//					})
//				}
//	
//				else {
//					//TODO: LOG ERRORS OTHER THAN USER NOT FOUND
//					
//					self.invalidCredentialsLabel.hidden = false
//				}
//			})
		}
	}
	@IBAction func signUp(sender: UIButton) {
	}
	
	@IBAction func forgotPassword(sender: UIButton) {
	}
	
	override func viewDidLoad() {
		emailTextBox.placeholder = "Email"
		passwordTextBox.placeholder = "Password"
		invalidCredentialsLabel.hidden = true
	}
	
	@IBAction func unwindToSignIn(segue:UIStoryboardSegue) {
	}
	
	private func isValidPassword(testStr:String) -> Bool{
		let passwordRegEx = "^[a-zA-Z0-9]+$"
		let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
		return passwordTest.evaluateWithObject(testStr)
	}
	
	private func isValidEmail(testStr:String) -> Bool {
		let emailRegEx = "^[a-zA-Z0-9._%+-]+\\@rochester.edu$"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluateWithObject(testStr)
	}
	
}