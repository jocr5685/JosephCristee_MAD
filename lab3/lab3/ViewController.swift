//
//  ViewController.swift
//  lab3
//
//  Created by Joey Cristee on 10/1/18.
//  Copyright © 2018 Joey Cristee. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITextFieldDelegate {
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var feet: UITextField!
    @IBOutlet weak var inches: UITextField!
    @IBOutlet weak var bmi: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        weight.delegate=self
        feet.delegate=self
        inches.delegate=self
        super.viewDidLoad()
        
        // I found this code online, the way the book solved this problem did not work in xcode for me. In there example there was a tap gesture recognizer option that showed up in the Document Outline, but it did not show up on mine.
        //  https://medium.com/@KaushElsewhere/how-to-dismiss-keyboard-in-a-view-controller-of-ios-3b1bfe973ad1
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
        
    }
    
    func updateBMI(){
        var inWeight:Float
        //var inFeet:Float
        var inInches:Float
        var finalFeet:Float = 0
        
        if weight.text!.isEmpty{
            inWeight = 0.0
        }
        else{
            inWeight = Float(weight.text!)!
        }
        
        if feet.text!.isEmpty{
            finalFeet = 0.0
        }
    
        
        let inFeet = Float(feet.text!)
        
        if inFeet != nil{
            if inFeet! > 9 || inFeet! < 1{
                finalFeet = 0.0
                let alert = UIAlertController(title: "Invalid height", message: "Height must be entered in feet as an interger greater than 0 and less than 10", preferredStyle: .alert )
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            else{
                finalFeet = Float(feet.text!)!
                finalFeet = finalFeet*12
            }
        }
        
        if inches.text!.isEmpty{
            inInches = 0.0
        }
        else{
            inInches = Float(inches.text!)!
        }
        
        let totalHeight = finalFeet + inInches
        let yourBMI = (inWeight/(totalHeight * totalHeight)) * 703
        
        let outBMI = "Your BMI is " + yourBMI.description + "%"
        
        
        if yourBMI < 100 {
        bmi.text = outBMI
        }
        else{
            bmi.text = "Your BMI is ..."
        }
        
        
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateBMI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

