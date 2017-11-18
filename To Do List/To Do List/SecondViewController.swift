//
//  SecondViewController.swift
//  To Do List
//
//  Created by Yu Chen on 11/17/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var itemTextField: UITextField!

    @IBAction func addItem(_ sender: Any) {
        
        
        print("HERE")
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        print("HERE3")
        if let tempItems = itemsObject as? [String]{
            
            items = tempItems
                    print("HERE4")
            items.append(itemTextField.text!)
        } else{
                    print("HERE5")
            items = [itemTextField.text!]
        }
        print("HERE6")
        UserDefaults.standard.set(items, forKey: "items")
                print("HERE7")
        itemTextField.text = ""
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

