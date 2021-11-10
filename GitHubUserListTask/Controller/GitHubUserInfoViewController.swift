//
//  GitHubUserInfoViewController.swift
//  GithubUserListTask
//
//  Created by ahmed on 28/10/2021.
//

import UIKit

class GitHubUserInfoViewController: UIViewController {

    @IBOutlet var gitHubUserInfoView: GitHubUserInfoView!
    var gitHubUser: GitHubUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gitHubUserInfoView.gitHubUser = gitHubUser
        navigationItem.title = gitHubUser?.username
    }
}
