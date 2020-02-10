//
//  ViewController.swift
//  UISearch
//
//  Created by Sridatta Nallamilli on 31/12/19.
//  Copyright © 2019 Sridatta Nallamilli. All rights reserved.
//

import UIKit

struct nameData {
    var fname: String = ""
    var lname: String = ""
}

class ViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    
    @IBOutlet weak var dataTable: UITableView!
    
    var arrData = [nameData]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        searchBarSetup()
        dataModelSetup()
        
    }
    
    private func dataModelSetup() {
        arrData = [
            nameData(fname: "Albert", lname: "Roger"),
            nameData(fname: "Steve", lname: "Smith"),
            nameData(fname: "Captain", lname: "Lee"),
            nameData(fname: "Chirag", lname: "Arya"),
            nameData(fname: "Tony", lname: "Stark"),
            nameData(fname: "Lee", lname: "Cooper"),
            nameData(fname: "Sri", lname: "Nidhi"),
            nameData(fname: "Anurag", lname: "Chowdary"),
            nameData(fname: "Antony", lname: "Christ"),
            nameData(fname: "Tony", lname: "Ray"),
            nameData(fname: "Sarah", lname: "Jones"),
            nameData(fname: "James", lname: "Pattrick"),
            nameData(fname: "Harry", lname: "Potter"),
            nameData(fname: "Emma", lname: "Watson"),
            nameData(fname: "Sirius", lname: "Snake"),
        ]
    }
    
    private func searchBarSetup() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }

}


extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text else { return }
        
        if searchText == "" {
            dataModelSetup()
        } else {
            dataModelSetup()
            
            for i in 0..<arrData.count {
                print(arrData[i].fname)
            }
            
//            for nameData in arrData {
//                print("Names are \(nameData.fname)" + " " + "\(nameData.lname)")
//
////                arrData = arrData.filter {
////                    $0.fname.contains(searchText)
////                }
////                arrData = arrData.filter {
////                    $0.lname.contains(searchText)
////                }
//            }
            
            
//            for _ in arrData {
//                arrData = arrData.filter {
//                    $0.fname.contains(searchText)
//                    $0.lname.contains(searchText)
//                }
//            }
            
            arrData = arrData.filter {
                $0.fname.contains(searchText)
            }
           
        }
        dataTable.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrData[indexPath.row].fname
        cell.detailTextLabel?.text = arrData[indexPath.row].lname
        return cell
    }
    
    
}
