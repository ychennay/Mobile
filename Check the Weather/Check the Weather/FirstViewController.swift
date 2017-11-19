//
//  FirstViewController.swift
//  Check the Weather
//
//  Created by Yu Chen on 11/18/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBAction func getWeather(_ sender: Any) {
        
        
        let url = URL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest")
        
        print(cityTextField.text)
        print(url)
        
        self.view.endEditing(true)
        
        let request = NSMutableURLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            var message =  ""
            
            if let error = error{
                print(error)
            } else{
                
                if let unwrappedData = data {
                    
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    
                    if let contentArray = dataString?.components(separatedBy: stringSeparator){
                        
                        if contentArray.count > 1 {
                            
                            stringSeparator = "</span>"
                            
                            let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                            
                            if newContentArray.count > 1 {
                                
                                message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                print(message)
                                
                            }
                        }
                        
                    }
                }
            }
            
            if message == ""{
                message = "The weather in that city couldn't be found. Please try again."
            }
            DispatchQueue.main.sync(execute: {
                self.resultLabel.text = message
            })
            
        }
        
        task.resume()
        
    }
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    

}

