//
//  GitHubUserInfoViewController.swift
//  GithubUserListTask
//
//  Created by ahmed on 28/10/2021.
//

import UIKit

class GitHubUserInfoViewController: UIViewController {

    var gitHubUser: GitHubUser?
    @IBOutlet var gitHubUserInfoView: GitHubUserInfoView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gitHubUserInfoView.gitHubUser = gitHubUser
        navigationItem.title = gitHubUser?.username
    }
}
