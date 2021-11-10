//
//  GithubUserCollectionViewCell.swift
//  GithubUserListTask
//
//  Created by ahmed on 26/10/2021.
//

import UIKit

class GitHubUserCell: UICollectionViewCell {

    @IBOutlet var view: UIView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var company: UILabel!
    @IBOutlet var blog: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var publicRepositories: UILabel!
    @IBOutlet var followers: UILabel!
    @IBOutlet var following: UILabel!
    static let identifier = "GitHubUserCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func viewInit() {
        backgroundColor = .clear
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 10
        imageInit()
    }
    
    func imageInit() {
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = 10
        userImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func configure(with gitHubUserCellViewModel: GitHubUserCellViewModel) {
        viewInit()
        userImageView.image = gitHubUserCellViewModel.image
        username.text = gitHubUserCellViewModel.username
        name.text = gitHubUserCellViewModel.name
        company.text = gitHubUserCellViewModel.company
        blog.text = gitHubUserCellViewModel.blog
        location.text = gitHubUserCellViewModel.location
        publicRepositories.text = gitHubUserCellViewModel.repositories
        followers.text = gitHubUserCellViewModel.followers
        following.text = gitHubUserCellViewModel.following
    }
}
