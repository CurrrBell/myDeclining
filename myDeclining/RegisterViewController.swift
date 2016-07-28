//
//  RegisterViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 1/24/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
	
	@IBOutlet weak var emailTextBox: UITextField!
	@IBOutlet weak var passwordTextBox: UITextField!
	@IBOutlet weak var errorLabel: UILabel!
	
	
	
	override func viewDidLoad() {
		emailTextBox.placeholder = "Email"
		passwordTextBox.placeholder = "Password"
		errorLabel.hidden = true
	}
	
	@IBAction func signUp(sender: UIButton) {
		
		let email = self.emailTextBox.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
		let password = self.passwordTextBox.text
		
		// Validate the text fields
		
		if !isValidEmail(email){
			errorLabel.text = "Please enter a valid Rochester.edu email address"
			errorLabel.hidden = false
			
		}
			
		
		
		else {
			// Run a spinner to show a task in progress
			let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
			spinner.startAnimating()
			
			/*



			refactor



			*/
			
			FIRAuth.auth()?.createUserWithEmail(email, password: password!) { (user, error) in
				spinner.stopAnimating()
				
				if ((error) != nil) {
					self.errorLabel.text = "Error: \(error)"
					self.errorLabel.hidden = false
					
				} else {
					let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Nav")
					self.presentViewController(viewController, animated: true, completion: nil)
				}
			}
			
//			let newUser = PFUser()
//			
//			newUser.username = email
//			newUser.password = password
//			newUser.email = email
//			
//			// Sign up the user asynchronously
//			newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
//				
//				// Stop the spinner
//				spinner.stopAnimating()
//				if ((error) != nil) {
//					self.errorLabel.text = "Error: \(error)"
//					self.errorLabel.hidden = false
//					
//				} else {
//					//self.errorLabel.text = "Success"
//					self.errorLabel.hidden = false
//					dispatch_async(dispatch_get_main_queue(), { () -> Void in
//						let installation = PFInstallation.currentInstallation()
//						installation["user"] = PFUser.currentUser()
//						installation.saveInBackground()
//						let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Nav") 
//						self.presentViewController(viewController, animated: true, completion: nil)
//					})
//				}
//			})
		}
		
		
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
