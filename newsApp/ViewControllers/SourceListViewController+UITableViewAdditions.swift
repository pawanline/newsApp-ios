//
//  SourceListViewController+UITableViewAdditions.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation
import UIKit

extension SourceListViewController : UITableViewDataSource {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as? SourceTableViewCell
        cell?.configureCell(indexPath, sourceList[indexPath.row])

        return cell!
    }
    
}
