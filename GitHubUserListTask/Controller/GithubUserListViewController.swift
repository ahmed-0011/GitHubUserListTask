//
//  ViewController.swift
//  GithubUserListTask
//
//  Created by ahmed on 26/10/2021.
//

import UIKit

class GithubUserListViewController: UIViewController, GitHubUserListDelegate {
    
    @IBOutlet var gitHubUsersView: GithubUserListView!
    private let dataManager = DataManager()
    private var gitHubUsers: [GitHubUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gitHubUsersView.delegate = self
        gitHubUsersView.gitHubUsers = gitHubUsers
        gitHubUsersView.index = dataManager.getIndex()
        gitHubUsers = dataManager.retrieveUsers()
        if gitHubUsers != [] {
            self.gitHubUsersView.gitHubUsers = gitHubUsers
            self.gitHubUsersView.collectionView.reloadData()
        } else {
            fetchUsers(index: 0)
        }
    }
    
    func onCellClick(row: Int) {
        if let gitHubUserInfoViewController = storyboard?.instantiateViewController(withIdentifier: "GitHubUserInfoViewController") as? GitHubUserInfoViewController {
            let gitHubUser = gitHubUsers[row]
            gitHubUserInfoViewController.gitHubUser = gitHubUser
            navigationController?.pushViewController(gitHubUserInfoViewController, animated: true)
        }
    }
    
    func fetchUsers(index: Int) {
        let networkingService = NetworkingService()
        networkingService.fetchUsers(index: index) { gitHubUsers in
            if gitHubUsers != [] {
                self.gitHubUsers.append(contentsOf: gitHubUsers)
                self.gitHubUsersView.gitHubUsers = self.gitHubUsers
                self.dataManager.saveUsers(gitHubUsers: gitHubUsers, index: index)
                self.gitHubUsersView.collectionView.reloadData()
            }
            else {
                self.gitHubUsersView.index -= 1 // minus 1 because no new page fetched
                let alert = UIAlertController(title: "AlertTitle".localized, message: "AlertMessage".localized, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OkButton".localized, style: .default))
                self.present(alert, animated: true)
            }
        }
    }
}
