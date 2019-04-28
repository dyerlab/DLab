//
//  DataSetDialogController.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

public class DataSetDialogController: NSViewController {
    
    @IBOutlet weak var speciesNameField: NSTextField!
    @IBOutlet weak var numStrataField: NSTextField!
    @IBOutlet weak var numLociField: NSTextField!
    @IBOutlet weak var locusFormatPopup: NSPopUpButton!
    @IBOutlet weak var cancelButton: NSButton!
    @IBOutlet weak var okButton: NSButton!
    @IBOutlet weak var yesCoordianteRadioButton: NSButton!
    @IBOutlet weak var noCoordinateRadioButton: NSButton!
    

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        print("DataSetDialogController::viewDidLoad")
    }
    
    
    @IBAction func onDialogSetFolderButtonPushed(_ sender: AnyObject) {
        print("data location button pressed")
    }
    
    @IBAction func onCoordinateRadtioButtonChanged(_ sender: AnyObject) {
        
        if yesCoordianteRadioButton.state == .on {
            print("has coordiantes now")
        } else if noCoordinateRadioButton.state == .on {
            print("does not have coordinates any more")
        } else {
            print("wtf is going on here")
        }
    }
    
    
}
