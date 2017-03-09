//
//  ArticleTableViewCell.swift
//  Newz
//
//  Created by Rael Kenny on 3/6/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var datePublished: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
