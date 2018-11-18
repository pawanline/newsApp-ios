//
//  SourceListViewController+UITableViewAdditions.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation
import UIKit

extension SourceListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as? SourceTableViewCell
        cell?.configureCell(indexPath, sources[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ArticleListViewController.articleListViewControllerInstanceObject()
        controller.source = sources[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
