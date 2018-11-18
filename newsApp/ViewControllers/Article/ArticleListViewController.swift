//
//  ArticleListViewController.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import ObjectMapper
import UIKit

class ArticleListViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var sourceTitleLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Instance Object -
    
    class func articleListViewControllerInstanceObject() -> ArticleListViewController {
        let articleListController: ArticleListViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.articleListControllerIdentifier) as! ArticleListViewController
        return articleListController
    }
    
    // MARK: - Variables
    
    var articles: [Article] = []
    var source: Source?
    let cellIdentifier = "ArticleTableViewCell"
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetup()
        fetchArticles()
    }
    
    // MARK: - IB Actions
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Methods
    
    func doInitialSetup() {
        sourceTitleLabel.text = source?.name
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
    }
    
    // MARK: - API Call
    
    func fetchArticles() {
        view.showLoader()
        let apiUrlString = Constants.APIServices.article + "?sources=" + "\(source!.id ?? "")&apiKey=" + Constants.API_KEY
        HttpClient.sharedInstance.apiRequestCall(method: .get, apiURL: apiUrlString) { [weak self] success, json, _ in
            self?.view.hideLoader()
            if success {
                if json != nil {
                    if let result = json as? Dictionary<String, AnyObject> {
                        if let result = result["articles"] as? [[String: Any]] {
                            self?.articles = Mapper<Article>().mapArray(JSONArray: result)
                        }
                        self?.tableView.reloadData()
                    }
                    
                } else {
                    // handle empty result
                }
            } else {
                // handle failure
        } }
    }
}
