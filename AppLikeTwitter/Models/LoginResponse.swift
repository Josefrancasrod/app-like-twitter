//
//  LoginResponse.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 25/10/21.
//

import Foundation

struct LoginResponse: Codable{
    let user: User
    let token: String
}
