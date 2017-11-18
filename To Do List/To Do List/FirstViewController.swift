//
//  FirstViewController.swift
//  To Do List
//
//  Created by Yu Chen on 11/17/17.
//  Copyright © 2017 Yu Chen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items:[String] = []
    
    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")

        var cellLabel = ""

        if let tempLabel = items[indexPath.row] as? String {
            cellLabel = tempLabel
        }

        cell.textLabel?.text = cellLabel

       return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items, forKey: "items")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        print("FIRST")
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        print("EXECUTED")
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String]{
            
            items = tempItems
            
        }
        table.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

