//
//  ArticleListViewController+UITableViewAdditions.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation
import UIKit

extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ArticleTableViewCell
        cell?.configureCell(indexPath, articles[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = LoadWebViewController.loadWebViewControllerInstanceObject()
        controller.urlString = articles[indexPath.row].url!
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
