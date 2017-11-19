//
//  ViewController.swift
//  Animations
//
//  Created by Yu Chen on 11/18/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageCounter = 0
    
    @IBOutlet weak var image: UIImageView!
    @IBAction func nextImage(_ sender: Any) {
        
        var number = ""
        
        if imageCounter < 10{
            
           number = "0" + String(imageCounter)
            imageCounter += 1
        } else if imageCounter < 28 {
            
            number = String(imageCounter)
               imageCounter += 1
            
        } else {
            imageCounter = 0
            number = "0" + String(imageCounter)
        }
        print(number)
        image.image = UIImage(named: "frame_" + number + "_delay-0.1s.gif")
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

