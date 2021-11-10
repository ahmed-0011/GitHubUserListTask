//
//  GitHubUserInfoCell.swift
//  GithubUserListTask
//
//  Created by ahmed on 28/10/2021.
//

import UIKit

class GitHubUserInfoCell: UITableViewCell {

    @IBOutlet var userInfo: UILabel!
    static let identifier = "GitHubUserInfoCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func configure(with gitHubUserInfoCellViewModel: GitHubUserInfoCellViewModel) {
        userInfo.text = gitHubUserInfoCellViewModel.info
    }
}
