//
//  SearchUserViewPresenter.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/25.
//

import Foundation

protocol Input {
    func didTappedSearchButton(searchText: String)
}

protocol UserView {
    func reloadData(_ users: [SearchResult.UserData])
}

final class SearchUserViewPresenter: Input {
    
    //MARK: - Vars
    
    var model = UserModel()
    private var view: UserView?
    
    //MARK: - Function
    
    func didTappedSearchButton(searchText: String) {

        print("Receive " + searchText)
        model.fetchUserData(text: searchText, completion: {
            view?.reloadData(model.userData)
        })
    }
}
