//
//  Article.swift
//  NewsApp
//
//  Created by Sergey Simashov on 03.02.2023.
//

import Foundation

struct Article : Codable{
    let source : Source
    let title : String
    let description : String?
    let url : String
    let urlToImage : String?
    let publishedAt : String
}
