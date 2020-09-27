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
    
//    var fetcher = UserModel()
    var userData: [UserData] = []
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    //MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        
        let cellNib = UINib(nibName: "SearchUserTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "Cell")
        
//        fetcher.fetchUserData()
        guard let url = URL(string: "https://api.github.com/search/users?q=yotubarail") else {
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
                        self.tableView.reloadData()
                        dump(self.userData)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        })
        task.resume()

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
        performSegue(withIdentifier: "showUserDetail", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
    }
}
