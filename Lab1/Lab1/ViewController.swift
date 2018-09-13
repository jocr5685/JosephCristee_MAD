//
//  ViewController.swift
//  Lab1
//
//  Created by Joey Cristee on 9/12/18.
//  Copyright © 2018 Joey Cristee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var message: UILabel!

    @IBOutlet weak var imageChange: UIImageView!
    @IBAction func walking(_ sender: UIButton) {
        if sender.tag == 1{
            message.text = "Christopher Walken"
            imageChange.image=UIImage(named:"Walken")
        }
        if sender.tag == 2{
            message.text = "Christopher Sittin"
            imageChange.image=UIImage(named:"Sitting")
        }
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

