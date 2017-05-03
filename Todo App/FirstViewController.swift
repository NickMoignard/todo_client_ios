//
//  FirstViewController.swift
//  Todo App
//
//  Created by Nicholas Moignard on 3/5/17.
//  Copyright © 2017 Nicholas Moignard. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate {
    
    var list = ["Hello", "World", "Hello", "Universe", "Hell", "On", "Earth"]
    
    @IBOutlet weak var tableViewCell: UITableViewCell!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource Delegate Methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    
    @IBAction func addTodo(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "Some default text"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            
            if (textField.text != "" || textField.text != nil ) {
                self.list.append(textField.text!)
            }
            self.tableView.reloadData()
            
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
}

