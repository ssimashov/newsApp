//
//  NewsTableViewCellViewModel.swift
//  NewsApp
//
//  Created by Sergey Simashov on 04.02.2023.
//

import UIKit

class NewsTableViewCellViewModel{
    let title : String
    let imageURL : URL?
    var imageData : Data? = nil
    
    init(title : String,
         imageURL : URL?){
        self.title = title
        self.imageURL = imageURL
    }
}
