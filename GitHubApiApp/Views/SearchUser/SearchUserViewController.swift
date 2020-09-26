//
//  SearchUserViewController.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/24.
//

import UIKit

class SearchUserViewController: UIViewController {
    
    //MARK: - Vars
    
//    private(set) var presenter; SearchUserViewPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    var fetcher = UserModel()
    
    let stringArray = ["1", "2", "3"]

    //MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        
        let cellNib = UINib(nibName: "SearchUserTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "Cell")

        navigationItem.title = "Search User"
    }
}

//MARK: - taleView DataSource

extension SearchUserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchUserTableViewCell
        cell.userNameLabel.text = stringArray[indexPath.row]
        
        return cell
    }
}

//MARK: - tableView Delegate

extension SearchUserViewController: UITableViewDelegate {
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showUserDetail", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
    }
}
