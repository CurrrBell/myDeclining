//
//  SlideOutViewController.swift
//  myDeclining
//
//  Created by Christopher Bell on 2/2/16.
//  Copyright © 2016 Christopher Bell. All rights reserved.
//

import UIKit


class MyNavigationViewController: ENSideMenuNavigationController, ENSideMenuDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
		
		sideMenu = ENSideMenu(sourceView: self.view, menuViewController: UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("menu") , menuPosition:.Left)
		sideMenu?.delegate = self //optional
		sideMenu?.menuWidth = 180.0 // optional, default is 160
		sideMenu?.bouncingEnabled = false
		//sideMenu?.allowPanGesture = false
		// make navigation bar showing over side menu
		//view.bringSubviewToFront(navigationBar)

        // Do any additional setup after loading the view.
    }

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - ENSideMenu Delegate
	func sideMenuWillOpen() {		
		print("sideMenuWillOpen")
	}
	
	func sideMenuWillClose() {
		print("sideMenuWillClose")
	}
	
	func sideMenuDidClose() {
		print("sideMenuDidClose")
	}
	
	func sideMenuDidOpen() {
	}
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
