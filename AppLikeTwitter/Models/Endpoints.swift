//
//  Endpoints.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 25/10/21.
//

import Foundation

struct Endpoints {
    static let domain = "https://platzi-tweets-backend.herokuapp.com/api/v1"
    static let login = Endpoints.domain + "/auth"
    static let register = Endpoints.domain + "/register"
    static let posts = Endpoints.domain + "/posts"
    static let delete = Endpoints.domain + "/posts/{ID_DEL_POST}" //Check
}
