//
//  SearchUserViewController.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/24.
//

import UIKit
import DZNEmptyDataSet

class SearchUserViewController: UIViewController {
    
    //MARK: - Vars
    private var presenter = SearchUserViewPresenter()
    var userData = [SearchResult.UserData]()
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
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
        // tableViewのcellにxibを設定
        let cellNib = UINib(nibName: "SearchUserTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "Cell")
        
        // searchBarの設定
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
        searchBar.keyboardType = .alphabet
        
        presenter.view = self
                
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
        let userViewData = userData[indexPath.row]
        cell.userNameLabel.text = userViewData.login
        cell.avatarImageView.image = UIImage(url: userViewData.avatarUrl)
        cell.userTypeLabel.text = userViewData.type
        
        return cell
    }
}


//MARK: - tableView Delegate
extension SearchUserViewController: UITableViewDelegate {
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let userViewData = userData[indexPath.row]
        selectedUrl = userViewData.url
        userName = userViewData.login
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
        searchBar.setShowsCancelButton(false, animated: true)
        if searchBar.text!.trimmingCharacters(in: .whitespaces) == "" {
            self.blankErrorHUD()
        } else {
            guard let text = searchBar.text else {return}
            presenter.didTappedSearchButton(searchText: text)
            showProgress()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
    }
}

//MARK: - Protocol UserView
extension SearchUserViewController: UserView {
    
    func reloadData(_ users: [SearchResult.UserData]) {

        userData = users
        print(users)
        if self.userData == [] {
            self.noUserErrorHUD()
            self.tableView.reloadData()
        } else {
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            self.hideProgress()
        }
    }
}

//MARK: - DZNEmptyDataSetSource, Delegate
extension SearchUserViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "検索したいユーザー名を\n入力してください")
    }
}
