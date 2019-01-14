//
//  SearchUserViewController.swift
//  MVP
//
//  Created by 佐藤賢 on 2019/01/14.
//  Copyright © 2019 佐藤賢. All rights reserved.
//

import UIKit
import GitHub

final class SearchUserViewController: UIViewController {
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    private var presenter: SearchUserPresenterInput!

    func inject(presenter: SearchUserPresenterInput) {
        self.presenter = presenter
    }
}

extension SearchUserViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.didTapSearchButton(text: searchBar.text)
    }
}

// ユーザー入力を Presenter に伝える
extension SearchUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRow(at: indexPath)
    }
}

// ユーザー入力を Presenter に伝える
extension SearchUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

// Presenter から描画処理を受け取る
extension SearchUserViewController: SearchUserPresenterOutput {
    func updateUser(_ user: [User]) {
        tableView.reloadData()
    }

    func transitionToUserDetail(userName: String) {
        let userDetailVC = UIStoryboard(
        name: "UserDetail",
        bundle: nil)
        .instantiateInitialViewController() as! UserDetailViewController

    }
}


