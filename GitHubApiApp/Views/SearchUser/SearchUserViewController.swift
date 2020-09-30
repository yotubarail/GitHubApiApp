//
//  SearchUserViewController.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/24.
//

import UIKit

class SearchUserViewController: UIViewController {
    
    //MARK: - Vars
    
    var model = UserModel()
    private var presenter = SearchUserViewPresenter()
    var userData: [SearchResult.UserData] = []
    var selectedUrl: String!
    var userName: String!
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableViewの設定
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        
        // tableViewのcellにxibを設定
        let cellNib = UINib(nibName: "SearchUserTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "Cell")
        
        // searchBarの設定
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
        searchBar.keyboardType = .alphabet
        
        model.fetchUserData(text: "yotubarail")
                
        navigationItem.title = "Search User"
    }
}



//MARK: - taleView DataSource

extension SearchUserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchUserTableViewCell
        cell.userNameLabel.text = userData[indexPath.row].login
        cell.avatarImageView.image = UIImage(url: userData[indexPath.row].avatarUrl)
        cell.userTypeLabel.text = userData[indexPath.row].type
        
        return cell
    }
}


//MARK: - tableView Delegate

extension SearchUserViewController: UITableViewDelegate {
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        selectedUrl = userData[indexPath.row].url
        userName = userData[indexPath.row].login
        performSegue(withIdentifier: "showUserDetail", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if segue.identifier == "showUserDetail" {
            let userDetailVC: UserDetailViewController = segue.destination as! UserDetailViewController
            userDetailVC.userUrl = selectedUrl!
            userDetailVC.titleText = userName!
        }
    }
}


//MARK: - searchBar Delegate

extension SearchUserViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
        guard let text = searchBar.text else {return}
        presenter.didTappedSearchButton(searchText: text)
        searchBar.setShowsCancelButton(false, animated: true)
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
    }
}
