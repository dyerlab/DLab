//
//  MainWindowController.swift
//  DLab
//
//  Created by Rodney Dyer on 4/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        print("MainWindowController::viewDidLoad")
    }

}




extension MainWindowController {
    
    @IBAction func switchToDataViewOne(_ sender: AnyObject ) {
        print("Asking to switch to data view one")
    }
    
    
    @IBAction func switchToDataViewTwo(_ sender: AnyObject ) {
        print("Asking to switch to data view two")
    }
    
    
    @IBAction func switchToDataViewThree(_ sender: AnyObject ) {
        print("Asking to switch to data view three")
    }
    
}
