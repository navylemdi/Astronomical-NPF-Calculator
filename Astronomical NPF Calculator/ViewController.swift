//
//  ViewController.swift
//  Astronomical NPF Calculator
//
//  Created by DILEM Yvan on 01/09/2021.
//  Copyright © 2021 BibouCorp. All rights reserved.
//

import UIKit
var ExposureTime :Double = 0.0

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SensorSizeField: UITextField!
    @IBOutlet weak var ApertureField: UITextField!
    @IBOutlet weak var FocalLengthField: UITextField!
    @IBOutlet weak var NbpixelField: UITextField!
    @IBOutlet weak var PixDimField: UITextField!
    @IBOutlet weak var DeclinationField: UITextField!
    @IBOutlet weak var AccuracyField: UITextField!
    @IBOutlet weak var CalculationValue: UILabel!

//  @IBOutlet weak var Picker: UIPickerView!
    var SensorSizePickerView = UIPickerView()
    var AccuracyPickerView = UIPickerView()
    
    let  SensorSize = ["Full Frame", "APS-C", "Micro 4/3"]
    let  Accuracy = ["Pin point stars", "Slight trails", "Visible trail"]
    
    @IBAction func Calculate(_ sender: UIButton) {
        Calcul()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ApertureField.delegate = self
        self.FocalLengthField.delegate = self
        self.NbpixelField.delegate = self
        self.PixDimField.delegate = self
        self.DeclinationField.delegate = self

        self.SensorSizeField.inputView = SensorSizePickerView
        self.AccuracyField.inputView = AccuracyPickerView
        
        self.SensorSizeField.textAlignment = .center
        self.SensorSizePickerView.dataSource = self
        self.SensorSizePickerView.delegate = self
        self.AccuracyPickerView.dataSource = self
        self.AccuracyPickerView.delegate = self
        self.AccuracyField.textAlignment = .center
        SensorSizePickerView.tag = 1
        AccuracyPickerView.tag = 2
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)//ca marche pas !!!!
    }
    func hidekeyboard(){
        ApertureField.resignFirstResponder()
        FocalLengthField.resignFirstResponder()
        NbpixelField.resignFirstResponder()
        PixDimField.resignFirstResponder()
        DeclinationField.resignFirstResponder()
    }
    func Calcul(){
        if ((self.ApertureField.text!) != "") && ((self.FocalLengthField.text!) != "") && ((self.PixDimField.text!) != "") && ((self.DeclinationField.text!) != "") {
            let N  = Double(ApertureField.text!)
            let F  = Double(FocalLengthField.text!)
            let P  = Double(PixDimField.text!)
            let D  = Double(DeclinationField.text!)
            ExposureTime = (16.856*Double(N!) + 0.010*Double(F!) + 13.713*Double(P!))/(Double(F!)*cos(Double(D!)*Double.pi/180))
            print(ExposureTime)
            return CalculationValue.text = String(round(ExposureTime*100)/100) + " s"
        
        } else {
            return CalculationValue.text = "No values"
        }
    }

    
//    UITextFieldDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return pressed")
        hidekeyboard()
        return true
    }
    
}
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return SensorSize.count
        case 2:
            return Accuracy.count
        default:
            return 1
        }
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return SensorSize[row]
        case 2:
            return Accuracy[row]
        default:
            return "Data not Found"
        }
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            SensorSizeField.text = SensorSize[row]
            SensorSizeField.resignFirstResponder()
            
        case 2:
            AccuracyField.text = Accuracy[row]
            AccuracyField.resignFirstResponder()
        default:
            return
        }
    }
}

