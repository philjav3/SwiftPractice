//
//  toLeftUnwind.swift
//  Practice
//
//  Created by Phil Javinsky III on 5/18/17.
//  Copyright © 2017 Phil Javinsky III. All rights reserved.
//

import UIKit

class toLeftUnwind: UIStoryboardSegue {

    override func perform() {
        let toVC = self.destination
        let fromVC = self.source
        
        fromVC.view.superview?.insertSubview(toVC.view, aboveSubview: fromVC.view)
        toVC.view.transform = CGAffineTransform(translationX: -fromVC.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            toVC.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: { success in
            fromVC.dismiss(animated: false, completion: nil)
        })
    }
    
}
