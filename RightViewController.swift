//
//  RightViewController.swift
//  Practice
//
//  Created by Phil Javinsky III on 5/16/17.
//  Copyright © 2017 Phil Javinsky III. All rights reserved.
//

import UIKit

class RightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableCells = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.showMainViewController))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        var tableCell = "One"
        tableCells.append(tableCell)
        tableCell = "Two"
        tableCells.append(tableCell)
        tableCell = "Three"
        tableCells.append(tableCell)
        tableCell = "Four"
        tableCells.append(tableCell)
        tableCell = "Five"
        tableCells.append(tableCell)
        tableCell = "Six"
        tableCells.append(tableCell)
        tableCell = "Seven"
        tableCells.append(tableCell)
        tableCell = "Eight"
        tableCells.append(tableCell)
        tableCell = "Nine"
        tableCells.append(tableCell)
        tableCell = "Ten"
        tableCells.append(tableCell)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showMainViewController() {
        performSegue(withIdentifier: "rightUnwindID", sender: self)
    }
    
    @IBAction func goHome(_ sender: Any) {
        performSegue(withIdentifier: "rightUnwindID", sender: self)
    }
    
    // Table View functions //
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        let currentCell = tableCells[indexPath.row]
        cell.textLabel?.text = currentCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondScene = segue.destination as! InfoViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedPhoto = tableCells[indexPath.row]
            secondScene.selectedCell = selectedPhoto
        }
    }*/

}
