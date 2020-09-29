//
//  SearchUserViewPresenter.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/25.
//

import Foundation

final class SearchUserViewPresenter {
    
    var model: SearchModelInput?

    func didTappedSearchButton(searchText: String) {
        model?.fetchUserData(text: searchText)
        print(searchText)
    }
   
}
