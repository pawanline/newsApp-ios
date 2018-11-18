//
//  ArticleTableViewCell.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import moa
import UIKit

class ArticleTableViewCell: UITableViewCell {

    // MARK: - IB Outlets
    
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var articleTitleLabel: UILabel!
    @IBOutlet var articleDescriptionLabel: UILabel!
    @IBOutlet var authorTimeStampLabel: UILabel!
    
    // MARK: - Variable
    
    let moa = Moa()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        doInitialSetup()
    }
    
    // MARK: - Helper Methods
    
    func doInitialSetup() {
        cellBackgroundView.layer.cornerRadius = 20
        cellBackgroundView.layer.masksToBounds = true
        cellBackgroundView.layer.borderWidth = 1.0
        cellBackgroundView.layer.borderColor = UIColor.darkGray.cgColor
        articleImageView.layer.cornerRadius = 4
        articleImageView.layer.masksToBounds = true
    }
    
    func configureCell(_ indexPath: IndexPath, _ article: Article) {
        if let image = article.urlToImage {
            articleImageView.moa.url = image
        } else {
            articleImageView.image = AppDefaults.Image.articleImagePlaceholderImage
        }
        
        articleTitleLabel.text = article.title
        articleDescriptionLabel.text = article.descriptionValue
        if let author = article.author {
            authorTimeStampLabel.text = author
        } else {
            authorTimeStampLabel.text = "Admin"
        }
    }
}
