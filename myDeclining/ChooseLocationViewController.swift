//
//  ChooseLocationViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 1/20/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class ChooseLocationViewController: UIViewController, GMSMapViewDelegate, ENSideMenuDelegate {
	
	@IBOutlet weak var mapView: GMSMapView!
	
	
	@IBAction func toggleSideMenu(sender: AnyObject) {
		toggleSideMenuView()
	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//self.sideMenuController()?.sideMenu?.delegate = self
		
		let camera = GMSCameraPosition.cameraWithLatitude(43.128971,
			longitude: -77.629287, zoom: 18)
		mapView.myLocationEnabled = true
		mapView.delegate = self
		mapView.clear()
		mapView.camera = camera
		mapView.settings.setAllGesturesEnabled(false)
		
		let pitPosition = CLLocationCoordinate2DMake(43.128892, -77.629828)
		let pitMarker = GMSMarker(position: pitPosition)
		pitMarker.title = "The Pit"
		pitMarker.icon = UIImage(named: "derpatoric")
		pitMarker.map = mapView
		
		let dougPosition = CLLocationCoordinate2DMake(43.129102, -77.628828)
		let dougMarker = GMSMarker(position: dougPosition)
		dougMarker.title = "Douglass"
		dougMarker.icon = UIImage(named: "derpatoric")
		dougMarker.map = mapView
		
//		self.navigationController!.navigationBar.setBackgroundImage(UIImage() , forBarMetrics: UIBarMetrics.Default)
//		self.navigationController!.navigationBar.shadowImage = UIImage();
//		self.navigationController!.navigationBar.translucent = true;
	}
	
	func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
		var success = true
		dispatch_async(dispatch_get_main_queue(), { () -> Void in
			switch marker.title{
				case "The Pit":
				self.performSegueWithIdentifier("showPit", sender: self)
				case "Douglass":
				self.performSegueWithIdentifier("showDouglass", sender: self)
			default:
				success = false
			}
		})
		return success
	}
	
	override func viewWillAppear(animated: Bool) {
		FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
			if let user = user {
				// User is signed in.
				self.title = user.email!
			} else {
				// No user is signed in.
				let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
				self.presentViewController(viewController, animated: true, completion: nil)
			}
		}

	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		var destination = segue.destinationViewController as UIViewController
		
		if let navCon = segue.destinationViewController as? UINavigationController{
			destination = navCon.visibleViewController!
		}
		
		if let LDVC = destination as? LocationDetailViewController{
			if let identifier = segue.identifier{
				switch identifier{
					case "showPit":
						LDVC.title = "The Pit"
						LDVC.diningHall	= "Pit"
					case "showDouglass":
						LDVC.title = "Douglass"
						LDVC.diningHall = "Douglass"
					default:
						LDVC.title = "uh oh"
				}
			}			
		}
	}
	
}
