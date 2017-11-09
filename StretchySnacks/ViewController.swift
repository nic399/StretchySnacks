//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Nicholas Fung on 2017-11-09.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var plusIconButton: UIButton!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    var optionsView:UIStackView!
    
    
    @IBAction func plusIconPressed(_ sender: Any) {
        print("Plus Icon Pressed - Current navBar height: \(self.navBarHeightConstraint.constant)")
        toggleNavigationBar()
    }
    
    func toggleNavigationBar() {
        if (self.navBarHeightConstraint.constant == 64.0) {
            self.navBarHeightConstraint.constant = 200.0

            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.35, initialSpringVelocity: 4.5, options: [], animations: {
                self.view.layoutIfNeeded()
                self.plusIconButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            }, completion: { (finished: Bool) in
                
            })
        }
        else if (self.navBarHeightConstraint.constant == 200.00) {
            self.navBarHeightConstraint.constant = 64.0
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.45, initialSpringVelocity: 4.5, options: [], animations: {
                self.view.layoutIfNeeded()
                self.plusIconButton.transform = CGAffineTransform(rotationAngle: 0.0)
            }, completion: { (finished: Bool) in
                
            })
            
        }
        else {
            print("Error: Unexpected navBar height")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //optionsView = UIStackView(
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

