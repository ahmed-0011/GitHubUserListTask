//
//  GitHubUserInfoView.swift
//  GithubUserListTask
//
//  Created by ahmed on 28/10/2021.
//

import UIKit

class GitHubUserInfoView: UIView {
    
    var gitHubUser: GitHubUser?
    @IBOutlet var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        tableViewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        tableViewInit()
    }
    
    func commonInit() {
        let view = Bundle(for: GitHubUserInfoView.self).loadNibNamed("\(GitHubUserInfoView.self)", owner: self)?.first as! UIView
        addSubview(view)
    }
    
    func tableViewInit() {
        tableView.register(GitHubUserInfoCell.nib(), forCellReuseIdentifier: GitHubUserInfoCell.identifier)
        tableView.sectionHeaderTopPadding = 0
        tableView.dataSource = self
        tableView.delegate = self
    }
}


// MARK: - Table View Data Source
extension GitHubUserInfoView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GitHubUserInfoCellViewModel.numOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: GitHubUserInfoCell.identifier, for: indexPath) as?
            GitHubUserInfoCell {
            
            let gitHubUserInfoCellViewModel = GitHubUserInfoCellViewModel(gitHubUser: gitHubUser!, row: indexPath.row)
            cell.configure(with: gitHubUserInfoCellViewModel)
            return cell
        }
        return GitHubUserInfoCell()
    }
}


// MARK: - Table View Delegate
extension GitHubUserInfoView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 200))
        header.backgroundColor = .red
        header.image = gitHubUser?.image!.af.imageScaled(to: CGSize(width: frame.size.width, height: 200))
        return header
    }
}
