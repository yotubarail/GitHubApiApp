//
//  SearchUserViewPresenter.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/25.
//

import Foundation

final class SearchUserViewPresenter {
    
    //MARK: - Vars
    var model = UserModel()

    //MARK: - Function 
    func didTappedSearchButton(searchText: String) {
        model.fetchUserData(text: searchText)
        print(searchText)
    }
}
