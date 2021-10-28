//
//  TweetRequest.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 26/10/21.
//

import Foundation

struct TweetRequest: Codable{
    let text: String
    let imageUrl: String
    let videoUrl: String
    let location: Location
}
