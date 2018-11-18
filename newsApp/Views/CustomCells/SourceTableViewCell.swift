//
//  SourceTableViewCell.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import UIKit

class SourceTableViewCell: UITableViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet var sourceTitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cellBackgroundView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellBackgroundView.layer.cornerRadius = 20
        cellBackgroundView.layer.masksToBounds = true
        cellBackgroundView.layer.borderColor = UIColor.gray.cgColor
        cellBackgroundView.layer.borderWidth = 1
    }
    
    
    // MARK: - Helper Methods
    func configureCell(_ indexPath:IndexPath, _ source: Sources) {
        sourceTitleLabel.text = source.name
        descriptionLabel.text = source.descriptionValue
    }
    

   
    
}
