//
//  ViewController.swift
//  lab2
//
//  Created by Joey Cristee on 9/20/18.
//  Copyright © 2018 Joey Cristee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emotion: UILabel!
    
    @IBOutlet weak var face: UIImageView!
    @IBOutlet weak var happyMad: UISegmentedControl!
    
    @IBOutlet weak var capState: UISwitch!
    @IBOutlet weak var fontLabel: UILabel!
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        if happyMad.selectedSegmentIndex == 0{
            emotion.text = "happy"
            emotion.textColor = UIColor.orange
            face.image=UIImage(named:"happy")
        }
        else if happyMad.selectedSegmentIndex == 1{
            emotion.text = "mad"
            emotion.textColor = UIColor.red
            face.image=UIImage(named:"mad")
        }
    }
    @IBAction func capSwitch(_ sender: UISwitch) {
        if capState.isOn {
            emotion.text = emotion.text?.uppercased()
        }
        else{
            emotion.text = emotion.text?.lowercased()
        }
    }
    @IBAction func fontSize(_ sender: UISlider) {
        let fontState = sender.value
        fontLabel.text = String(format: "%.0f", fontState)
        let fontStateCGFloat = CGFloat(fontState)
        emotion.font = UIFont.systemFont(ofSize: fontStateCGFloat)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

