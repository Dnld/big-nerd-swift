//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Donald Steinert on 1/27/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    let todoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoList.registerClassForTableView(tableView)
        tableView.dataSource = todoList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
        guard let text = itemTextField.text where text != "" else {
            return
        }
        todoList.addItem(text)
        tableView.reloadData()
        itemTextField.text = ""
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.itemCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("success")
    }
    
}

