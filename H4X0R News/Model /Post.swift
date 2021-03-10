//
//  Post.swift
//  H4X0R News
//
//  Created by DOUG UNO on 3/3/21.
//

import Foundation

struct Post: Decodable {
    let url: String?
    let title: String
    let points: Int
    //let objectID: String
}

struct Results: Decodable {
    let hits: [Post]
}








