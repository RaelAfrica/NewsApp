//
//  Article.swift
//  Newz
//
//  Created by Rael Kenny on 3/6/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit

class Article {
    
    let title:String
    let author:String
    let abstract:String
    let date:String
    let link: URL
    
    var thumbnail = UIImage()
    var fullSizeImage:URL
    
    init(title:String, author:String, abstract:String, date:String, imageURL:URL, link:URL) {
        self.title = title
        self.author = author
        self.abstract = abstract
        self.date = date
        self.fullSizeImage = imageURL
        self.link = link
    }
    
    func addThumbnail(fromURLString url:String ){
        //TODO: Fetch images
    }
    
    
}
