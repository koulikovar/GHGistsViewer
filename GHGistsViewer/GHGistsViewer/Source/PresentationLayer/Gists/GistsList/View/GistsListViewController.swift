//
//  GistsListViewController.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import UIKit

class GistsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var presenter: GistsListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: GistTableViewCell.cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: GistTableViewCell.cellIdentifier)

        tableView.rowHeight = UITableViewAutomaticDimension

        title = "GISTS_LIST_VC_TITLE".localized

        presenter.updateList()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GistsListViewController: GistsListView {
    func updateTableView() {
        tableView.reloadData()
    }

    func showError(message: String) {
        assertionFailure(message)
        print(message)
    }

    func push(_ view: DetailGistView) {
        navigationController?.pushViewController(view as! UIViewController, animated: true)
    }
}

extension GistsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GistTableViewCell.cellIdentifier) as? GistTableViewCell else {
                return UITableViewCell(style: .default, reuseIdentifier: "DefaultCellIdentifier")
        }

        let currentGist = presenter.list[indexPath.row]

        cell.title.text = currentGist.title
        cell.username.text = currentGist.owner.login

        presenter.loadImage(for: currentGist.owner.avatarUrl, success: { image in
            if let cellThatRequested = tableView.cellForRow(at: indexPath) as? GistTableViewCell {
                cellThatRequested.avatar.image = image
            }
        }, failure: {error in
            assertionFailure(error)
            print(error)
        })

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(presenter.list[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
