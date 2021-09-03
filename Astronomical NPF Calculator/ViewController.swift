//
//  ViewController.swift
//  Astronomical NPF Calculator
//
//  Created by DILEM Yvan on 01/09/2021.
//  Copyright © 2021 BibouCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ApertureField: UITextField!
    @IBOutlet weak var FocalLengthField: UITextField!
    @IBOutlet weak var NbpixelField: UITextField!
    @IBOutlet weak var PixDimField: UITextField!
    @IBOutlet weak var DeclinationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ApertureField.delegate = self
        self.FocalLengthField.delegate = self
        self.NbpixelField.delegate = self
        self.PixDimField.delegate = self
        self.DeclinationField.delegate = self
    }
    func hidekeyboard(){
        ApertureField.resignFirstResponder()
        FocalLengthField.resignFirstResponder()
        NbpixelField.resignFirstResponder()
        PixDimField.resignFirstResponder()
        DeclinationField.resignFirstResponder()
    }
    
//    UITextFieldDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return pressed")
        hidekeyboard()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
