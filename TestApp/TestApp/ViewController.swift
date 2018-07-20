//
//  ViewController.swift
//  TestApp
//
//  Created by Ivan Skorik on 7/8/18.
//  Copyright © 2018 Ivan Skorik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AddEmployeeViewControllerDelegate {
    //Variables, Outlets
    var employees = [Model]()
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let employee = Model(name: "Vasya", lastName: "Poopkin", dateOfBirth: Date(), salary: 200.0)
        employees.append(employee)
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsVC" {
            if let vc = segue.destination as? DetailViewController {
                let item = sender as? Model
                vc.model = item
            }
        }
        
        if segue.identifier == "showAddVC" {
            if let vc = segue.destination as? AddEmployeeViewController {
                vc.delegate = self
            }
        }
    }
    //AddNewEmployeeViewControllerDelegate
    func didTapSaveButton(model: Model) {
        employees.append(model)
        self.myTableView.reloadData()
    }
}

//UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    //cell creation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let employee = employees[indexPath.row]
        
        cell.textLabel?.text = "\(employee.name) \(employee.lastName)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = employees[indexPath.row]
        
        self.performSegue(withIdentifier: "showDetailsVC", sender: employee)
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    //delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            employees.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
