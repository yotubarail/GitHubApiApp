//
//  UserData.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/25.
//

import Foundation

struct UserData: Decodable,Identifiable {
    
    var id: Int
    var login: String
    var avatarUrl: String
    var type: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case login = "login"
        case avatarUrl = "avatar_url"
        case type = "type"
    }
}
