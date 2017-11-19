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
    var timer = Timer()
    var isAnimating = false
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func fadeIn(_ sender: Any) {
        
        image.alpha = 0
            UIView.animate(withDuration: 1, animations: {
                self.image.alpha = 1
            }
        )
    }
    
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
        
    }
    
    
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 2, animations: {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        })
        
    }
    
    
    @objc func animate(){
        
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
            image.image = UIImage(named: "frame_" + number + "_delay-0.1s.gif")
    
    }
    
    @IBAction func nextImage(_ sender: Any) {
    
        if isAnimating{
            timer.invalidate()
            isAnimating = false
            button.setTitle("Start Animation", for:[])
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            isAnimating = true
            button.setTitle("Stop Animation", for: [])
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

