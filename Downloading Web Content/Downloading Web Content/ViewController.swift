//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Yu Chen on 11/18/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = URL(string: "https://stackoverflow.com"){
            
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                
                if let error = error {
                    print(error)
                } else{
                    if let unwrappedData = data {
                        
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString)
                    
                        DispatchQueue.main.sync {
                            // code to update UI
                        }
                    }
                }
            }
            
            task.resume()
        }
      print("Hello")
        
        
//        webview.loadRequest(URLRequest(url: url!))
  
   //     webview.loadHTMLString("<h1>Hello</h1>", baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

