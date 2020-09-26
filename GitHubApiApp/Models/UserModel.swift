//
//  UserModel.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/25.
//

import Foundation

class UserModel {
    
    var userData: [UserData] = []

    init() {
        fetchUserData()
    }

    func fetchUserData() {

        guard let url = URL(string: "https://api.github.com/users?q=tom") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                let account = try! JSONDecoder().decode([UserData].self, from: data)
                self.userData = account.reversed()
                dump(self.userData)
            }
        })
        task.resume()
    }
}
