//
//  ViewController.swift
//  Practice
//
//  Created by Phil Javinsky III on 5/16/17.
//  Copyright © 2017 Phil Javinsky III. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.showLeftViewController))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.showRightViewController))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showLeftVC(_ sender: Any) {
        performSegue(withIdentifier: "leftSegueID", sender: self)
    }
    func showLeftViewController() {
        performSegue(withIdentifier: "leftSegueID", sender: self)
    }
    
    @IBAction func showRightVC(_ sender: Any) {
        performSegue(withIdentifier: "rightSegueID", sender: self)
    }
    func showRightViewController() {
        performSegue(withIdentifier: "rightSegueID", sender: self)
    }

    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue) {}
    
    /*override func segueForUnwinding(to toViewController: UIViewController, from fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier {
            if id == "leftUnwindID" {
                print("leftUnwindID")
                let unwindSegue = toRightSegue(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in })
                return unwindSegue
            }
            else if id == "rightUnwindID" {
                print("rightUnwindID")
                let unwindSegue = toLeftSegue(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in })
                return unwindSegue
            }
        }
        
        //return super.unwind(for: unwindSegue, towardsViewController: toViewController)
        return super.segueForUnwinding(to: toViewController, from: fromViewController, identifier: identifier)!
    }*/
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        print(segue.identifier!)
    }*/
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("unwind")
        print(unwindSegue.identifier!)
    }
}

