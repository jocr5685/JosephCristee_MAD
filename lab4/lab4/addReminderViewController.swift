//
//  addReminderViewController.swift
//  lab4
//
//  Created by Joey Cristee on 10/10/18.
//  Copyright © 2018 Joey Cristee. All rights reserved.
//

import UIKit

class addReminderViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputDescription: UITextField!
    @IBOutlet weak var inputTime: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneReminder"{
            let scene1ViewController = segue.destination as! ViewController
            //check to see that text was entered in the textfields
            if inputDescription.text!.isEmpty == false{
                scene1ViewController.input.remDescription=inputDescription.text
            }
            if inputTime.text!.isEmpty == false{
                scene1ViewController.input.remTime=inputTime.text
            }
        }
    }
    
    override func viewDidLoad() {
        inputDescription.delegate=self
        inputTime.delegate=self
        super.viewDidLoad()
       
        //  https://medium.com/@KaushElsewhere/how-to-dismiss-keyboard-in-a-view-controller-of-ios-3b1bfe973ad1
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
