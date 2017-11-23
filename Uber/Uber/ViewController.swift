//
//  ViewController.swift
//  Uber
//
//  Created by Yu Chen on 11/23/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var riderLabel: UILabel!
    @IBOutlet weak var userTypeSwitch: UISwitch!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    var signUpMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func topPressed(_ sender: Any) {
    }
    @IBAction func bottomPressed(_ sender: Any) {
        
        if (signUpMode){
            topButton.setTitle("Log In", for: .normal)
            bottomButton.setTitle("Sign Up", for: .normal)
            signUpMode = false
        } else{
            topButton.setTitle("Submit", for: .normal)
                bottomButton.setTitle("Switch to Log In", for: .normal)
            
        }
        
    }
    
}

