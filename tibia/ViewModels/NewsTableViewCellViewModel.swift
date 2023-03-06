//
//  NewsTableViewCellViewModel.swift
//  tibia
//
//  Created by allexis figueiredo on 05/03/23.
//

import Foundation

struct NewsTableViewCellViewModel: Codable {
    let id: Int
    let date: String
    let news: String
    let category: String
    let type: String
    let url: String
}
