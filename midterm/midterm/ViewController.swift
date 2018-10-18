//
//  ViewController.swift
//  midterm
//
//  Created by Joey Cristee on 10/18/18.
//  Copyright © 2018 Joey Cristee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var segState: UISegmentedControl!
    
    @IBOutlet weak var caloriesBurned: UILabel!
    @IBOutlet weak var milesRan: UILabel!
    @IBOutlet weak var inputTime: UITextField!
    
    @IBOutlet weak var weeklyState: UISwitch!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTime.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if sender.tag == 1{
            updateWorkout()
        }
        
    }
    @IBAction func showWeekly(_ sender: UISwitch) {
        updateWorkout()
    }
    
    @IBAction func showType(_ sender: UISegmentedControl) {
        updateWorkout()
        updateImage()
    }
    
    func updateImage(){
        if segState.selectedSegmentIndex == 0{
            imageType.image = UIImage(named:"run")
        }
        else if segState.selectedSegmentIndex == 1{
            imageType.image = UIImage(named:"bike")
        }
        else{
            imageType.image = UIImage(named:"swim")
        }
        
    }
    
    func updateWorkout(){
        var inTime:Float
        if inputTime.text!.isEmpty{
            inTime = 0.0
        }
        else{
            inTime = Float(inputTime.text!)!
        }
        
        let runLength = inTime / 10
        let weekLength = runLength*5
        let calories = inTime * 10
        let weekCal = calories*5
        
        let bikeLength = inTime / 4
        let bikeWeekLength = bikeLength * 5
        let bikeCalories = inTime * 8.5
        let weekBikeCal = bikeCalories * 5
        
        let swimLength = inTime / 30
        let swimWeekLength = swimLength * 5
        let swimCalories = inTime * 7
        let weekSwimCal = swimCalories * 5
        
        if runLength != nil{
            if runLength < 3 {
                let alert = UIAlertController(title: "Fitness Alert", message: "You should workout more!", preferredStyle: .alert )
                
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction)
                
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.inputTime.text="30"
                    self.updateWorkout()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                if weeklyState.isOn {
                    if segState.selectedSegmentIndex == 0{
                    milesRan.text = weekLength.description + " miles"
                    caloriesBurned.text = weekCal.description + " calories burned"
                    }
                    else if segState.selectedSegmentIndex == 1{
                        milesRan.text = bikeWeekLength.description + " miles"
                        caloriesBurned.text = weekBikeCal.description + " calories burned"
                    }
                    else{
                        milesRan.text = swimWeekLength.description + " miles"
                        caloriesBurned.text = weekSwimCal.description + " calories burned"
                    }
                }
                else{
                    if segState.selectedSegmentIndex == 0{
                        milesRan.text = runLength.description + " miles"
                        caloriesBurned.text = calories.description + " calories burned"
                    }
                    else if segState.selectedSegmentIndex == 1{
                        milesRan.text = bikeLength.description + " miles"
                        caloriesBurned.text = bikeCalories.description + " calories burned"
                    }
                    else{
                        milesRan.text = swimLength.description + " miles"
                        caloriesBurned.text = swimCalories.description + " calories burned"
                    }
                }
                
                
            }
        }
//        milesRan.text = runLength.description + " miles"
//        caloriesBurned.text = calories.description + " calories burned"
        
    }


}

