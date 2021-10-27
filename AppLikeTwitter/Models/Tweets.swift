//
//  Tweets.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 26/10/21.
//

import Foundation


struct Tweets: Codable {
    let post: [Tweet]
}

struct Tweet: Codable {
    let id: String
    let author: User
    let imageUrl: String
    let text: String
    let videoUrl: String
    let location: Location
    let hasVide: Bool
    let hasImage: Bool
    let hasLocation: Bool
    let cratedAt: String
}
