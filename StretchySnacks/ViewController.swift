//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Nicholas Fung on 2017-11-09.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var plusIconButton: UIButton!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    var optionsView:UIStackView!
    let foodOptionsArr = ["Oreos", "Pizza Pockets", "Pop Tarts", "Popsicle", "Ramen"]
    var datasourceArr:[String] = []
    let snackLabel = UILabel()
    var closed:NSLayoutConstraint!
    var opened:NSLayoutConstraint!
    
    
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        optionsView = UIStackView()
        optionsView.alignment = UIStackViewAlignment.center
        optionsView.distribution = UIStackViewDistribution.fillEqually
        let foodOptionWidth = (self.view.bounds.size.width - 20.0 - 4.0 * 3.0) / 5.0
        let foodOptionHeight:CGFloat = 90.0
        let foodOptionRect = CGRect(x: 0.0, y: 0.0, width: foodOptionWidth, height: foodOptionHeight)
        for i in 0..<foodOptionsArr.count {
            let foodName = foodOptionsArr[i]
            let foodImageView = UIImageView(image: UIImage(named: foodName))
            foodImageView.tag = i
            foodImageView.contentMode = UIViewContentMode.scaleToFill
            foodImageView.layer.masksToBounds = true
            foodImageView.frame = foodOptionRect
            foodImageView.isUserInteractionEnabled = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addFoodItem(_:)))
            foodImageView.addGestureRecognizer(tapGestureRecognizer)
            
            optionsView.addArrangedSubview(foodImageView)
        }
        navBarView.addSubview(optionsView)
        optionsView.translatesAutoresizingMaskIntoConstraints = false
        optionsView.leftAnchor.constraint(equalTo: navBarView.leftAnchor, constant: 10.0).isActive = true
        optionsView.rightAnchor.constraint(equalTo: navBarView.rightAnchor, constant: -10.0).isActive = true
        optionsView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: -10.0).isActive = true
        optionsView.heightAnchor.constraint(equalToConstant: 90.0).isActive = true
        optionsView.isHidden = true
        snackLabel.text = "SNACKS"
        navBarView.addSubview(snackLabel)
        snackLabel.translatesAutoresizingMaskIntoConstraints = false
        snackLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        closed = snackLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor)
        closed.isActive = true
        //closed.identifier = "CenterYNoOffest"
        opened = snackLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor, constant: -40.0)
        //opened.identifier = "CenterYOffset"
        
        
        
        
    }
    
    // MARK: Custom Nav Bar
    
    @IBAction func plusIconPressed(_ sender: Any) {
        print("Plus Icon Pressed - Current navBar height: \(self.navBarHeightConstraint.constant)")
        toggleNavigationBar()
    }
    
    func toggleNavigationBar() {
        if (self.navBarHeightConstraint.constant == 64.0) {
            self.navBarHeightConstraint.constant = 200.0
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.35, initialSpringVelocity: 4.5, options: [], animations: {
                self.plusIconButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
                self.optionsView.isHidden = false
                self.closed.isActive = false
                self.opened.isActive = true
                self.view.layoutIfNeeded()
                
            }, completion: nil)
        }
        else if (self.navBarHeightConstraint.constant == 200.00) {
            self.navBarHeightConstraint.constant = 64.0
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.45, initialSpringVelocity: 4.5, options: [], animations: {
                self.plusIconButton.transform = CGAffineTransform(rotationAngle: 0.0)
                self.optionsView.isHidden = true
                self.closed.isActive = true
                self.opened.isActive = false
                self.view.layoutIfNeeded()
                
            }, completion: nil)
            
        }
        else {
            print("Error: Unexpected navBar height")
        }
    }
    
    // MARK: Update datasource
    
    @objc func addFoodItem(_ sender:UITapGestureRecognizer) {
        let index = sender.view!.tag
        datasourceArr.insert(foodOptionsArr[index], at: 0)
        print("You tapped \(foodOptionsArr[index])")
        print("datasource is now \(datasourceArr)")
        self.tableView.reloadData()
    }
    
    // MARK: Tableview datasource methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell")!
        cell.textLabel?.text = datasourceArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasourceArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}













