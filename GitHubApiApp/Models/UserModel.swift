//
//  UserModel.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/25.
//

import Foundation

protocol SearchModelInput{

    func fetchUserData(text:String)
}


class UserModel: SearchModelInput {
    
    var userData: [SearchResult.UserData] = []

    func fetchUserData(text: String) {

        guard let url = URL(string: "https://api.github.com/search/users?q=andfactory") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data {
                do {
                    let searchedUserData = try JSONDecoder().decode(SearchResult.self, from: data).items
                    DispatchQueue.main.async {
                        self.userData = searchedUserData
                        dump(self.userData)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        })
        task.resume()
    }
}
