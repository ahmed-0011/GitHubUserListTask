//
//  GithubUserListView.swift
//  GithubUserListTask
//
//  Created by ahmed on 26/10/2021.
//

import UIKit

protocol GitHubUserListDelegate {
    func onCellClick(row: Int)
    func fetchUsers(index: Int)
}

class GithubUserListView: UIView {

    var gitHubUsers: [GitHubUser] = []
    var index: Int = 0
    var delegate: GitHubUserListDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        collectionViewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        collectionViewInit()
    }
    
    func commonInit() {
        let view = Bundle(for: GithubUserListView.self).loadNibNamed("\(GithubUserListView.self)", owner: self)?.first as! UIView
        addSubview(view)
    }
    
    func collectionViewInit() {
        collectionView.register(GitHubUserCell.nib(), forCellWithReuseIdentifier: GitHubUserCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}


// MARK: - Collection View Data Source
extension  GithubUserListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gitHubUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GitHubUserCell.identifier, for: indexPath) as?
            GitHubUserCell {
            let user = self.gitHubUsers[indexPath.row]
            let gitHubUserCellViewModel = GitHubUserCellViewModel(gitHubUser: user)
            cell.configure(with: gitHubUserCellViewModel)
            return cell
       }
        return GitHubUserCell()
    }
}


// MARK: - Collection View Delegate
extension  GithubUserListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onCellClick(row: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == gitHubUsers.count - 1 {
            index += 1
            delegate?.fetchUsers(index: index)
            print("index/page --> \(index)")
        }
    }
}

// MARK: - Collection View Delegate Flow Layout
extension GithubUserListView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = self.frame.height / 2
        let spacing: CGFloat = 6
        let width = (self.frame.width / 2) - spacing
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
