//
//  ViewController.swift
//  GithubUserListTask
//
//  Created by ahmed on 26/10/2021.
//

import UIKit

class GithubUserListViewController: UIViewController, GitHubUserListDelegate {
    
    @IBOutlet var gitHubUsersView: GithubUserListView!
    private var gitHubUsers: [GitHubUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarAppearance()
        
        gitHubUsersView.delegate = self
        gitHubUsersView.index = DataManager.shared.getIndex()
        gitHubUsers = DataManager.shared.retrieveUsers()
        if gitHubUsers != [] {
            self.gitHubUsersView.gitHubUsers = gitHubUsers
            self.gitHubUsersView.collectionView.reloadData()
        } else {
            fetchUsers(index: 0)
        }
    }
    
    func showUserInfo(for item: Int) {
        if let gitHubUserInfoViewController = storyboard?.instantiateViewController(withIdentifier: "GitHubUserInfoViewController") as? GitHubUserInfoViewController {
            let gitHubUser = gitHubUsers[item]
            gitHubUserInfoViewController.gitHubUser = gitHubUser
            navigationController?.pushViewController(gitHubUserInfoViewController, animated: true)
        }
    }
    
    func fetchUsers(index: Int) {
        gitHubUsersView.hasFinishedFetching = false
        NetworkingService.shared.fetchUsers(index: index) { gitHubUsers in
            if gitHubUsers != [] {
                self.gitHubUsersView.index += 1
                self.gitHubUsers.append(contentsOf: gitHubUsers)
                self.gitHubUsersView.gitHubUsers = self.gitHubUsers
                if index == 0 {
                    DataManager.shared.addUsers(gitHubUsers: gitHubUsers)
                } else {
                    DataManager.shared.updateUsers(gitHubUsers: gitHubUsers, index: index + 1)
                }
                self.gitHubUsersView.collectionView.reloadData()
            }
            else {
                let alert = UIAlertController(title: "FetchFailedAlertTitle".localized, message: "FetchFailedAlertMessage".localized, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OkButton".localized, style: .default))
                self.present(alert, animated: true)
            }
            self.gitHubUsersView.hasFinishedFetching = true
        }
    }
    
    func setNavigationBarAppearance() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 0.14118, green: 0.16078, blue: 0.18431, alpha: 1.0)
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}
