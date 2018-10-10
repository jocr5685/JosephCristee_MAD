//
//  ViewController.swift
//  lab4
//
//  Created by Joey Cristee on 10/10/18.
//  Copyright © 2018 Joey Cristee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var input = reminder()
    let filename = "reminder.plist"
    
    func dataFileURL(_ filename:String) -> URL?{
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        var url : URL?
        url = urls.first?.appendingPathComponent(filename)
        return url
    }
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        timeLabel.text = input.remTime
        descriptionLabel.text = input.remDescription
        
    }
    
    override func viewDidLoad() {
        let fileURL = dataFileURL(filename)
        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            let url = fileURL!
            do {
                let data = try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                input = try decoder.decode(reminder.self, from: data)
                timeLabel.text = input.remTime
                descriptionLabel.text = input.remDescription
            }
                catch {
                    print("no file")
                }
        }
        else{
            print("file does not exist")
        }
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self,selector:
            #selector(self.applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
            
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func applicationWillResignActive(_ notification: Notification){
        let fileURL = dataFileURL(filename)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let plistData = try encoder.encode(input)
            try plistData.write(to: fileURL!)
        } catch {
            print("write error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

