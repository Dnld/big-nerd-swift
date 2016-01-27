//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Donald Steinert on 1/27/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    private let fileURL: NSURL = {
        let documentDirectoryURLs = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.URLByAppendingPathComponent("todolist.items")
    }()
    
    private var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func registerClassForTableView(tableView: UITableView) {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        
        print("saving files to \(fileURL)")
        if !itemsArray.writeToURL(fileURL, atomically: true) {
            print("Could not save to-do list")
        }
    }
    
    func loadItems() {
        if let items = NSArray(contentsOfURL: fileURL) as? [String] {
            self.items = items
        }
    }
    
    func addItem(item: String) {
        items.append(item)
        saveItems()
    }
    
}

extension TodoList: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        
        return cell
    }
}
