//
//  ViewController.swift
//  Permanent Data Storage
//
//  Created by Yu Chen on 11/17/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    @IBAction func savePressed(_ sender: Any) {
        
        UserDefaults.standard.set(numberField.text, forKey: "phone")
        
    }
    @IBOutlet weak var numberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let numberObject = UserDefaults.standard.object(forKey: "phone")
        
        if let number = numberObject as? String {
            numberLabel.text = number
            print("Yes")
        }
        
        UserDefaults.standard.set("Yu Chen", forKey: "name")
        let nameObject = UserDefaults.standard.object(forKey: "name")
        
        if let name = nameObject as? String{
            print(name)
        }
        
        let myArray = [1,2,3,4]
        UserDefaults.standard.set(myArray, forKey: "array")
        
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        
        if let array = arrayObject as? NSArray{
            print(array)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

