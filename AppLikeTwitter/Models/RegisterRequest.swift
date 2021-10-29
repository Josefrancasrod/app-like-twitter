//
//  RegisterRequest.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 28/10/21.
//

import Foundation

struct RegisterRequest: Codable {
    let email: String
    let password: String
    let names: String
}
