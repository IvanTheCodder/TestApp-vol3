//
//  DetailViewController.swift
//  TestApp
//
//  Created by Ivan Skorik on 7/19/18.
//  Copyright © 2018 Ivan Skorik. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var firstNameLabel: UILabel! {
        didSet {
            firstNameLabel.text = model?.name
        }
    }
    @IBOutlet weak var lastNameLabel: UILabel! {
        didSet {
            lastNameLabel.text = model?.lastName
        }
    }
    @IBOutlet weak var dateOfBirth: UILabel! {
        didSet {
            if let date = model?.dateOfBirth {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                dateOfBirth.text = formatter.string(from: date)
            }
        }
    }
    @IBOutlet weak var salary: UILabel! {
        didSet {
            salary.text = model?.salary.description
        }
    }
    @IBOutlet weak var navItem: UINavigationItem!
    
    var model: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.title = lastNameLabel.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
