//
//  SourceListViewController.swift
//  newsApp
//
//  Created by Pawan Kumar on 18/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import ObjectMapper
import UIKit

class SourceListViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Variables
    
    var sourceList: [Sources] = []
    let cellIdentifer = "SourceTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetUp()
        fetchSourceList()
    }
    
    // MARK: -  Helper Methods
    
    func doInitialSetUp() {
        tableView.register(UINib(nibName: cellIdentifer, bundle: nil), forCellReuseIdentifier: cellIdentifer)
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
    }
    
    // MARK: - API Call
    
    func fetchSourceList() {
        view.showLoader()
        HttpClient.sharedInstance.apiRequestCall(method: .get, apiURL: Constants.APIServices.sources) { [weak self] success, json, _ in
            self?.view.hideLoader()
            if success {
                if json != nil {
                    if let result = json as? Dictionary<String, AnyObject> {
                        if let result = result["sources"] as? [[String: Any]] {
                            self?.sourceList = Mapper<Sources>().mapArray(JSONArray: result)
                        }
                        self?.tableView.reloadData()
                    }
                    
                } else {
                    // handle empty area
                }
            }
        }
    }
}
