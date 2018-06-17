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

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.refreshControl = refreshControl

        title = "GISTS_LIST_VC_TITLE".localized

        refreshList()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     @objc private func refreshList() {
        presenter.updateList()
    }
}

extension GistsListViewController: GistsListView {
    func updateTableView() {
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }

    func showError(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL_BUTTON_TITLE".localized, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "REFRESH_BUTTON_TITLE".localized, style: .default, handler: { [weak self] action in
            self?.refreshList()
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func push(_ view: DetailGistView) {
        navigationController?.pushViewController(view as! UIViewController, animated: true)
    }
}

extension GistsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.list().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GistTableViewCell.cellIdentifier) as? GistTableViewCell else {
                return UITableViewCell(style: .default, reuseIdentifier: "DefaultCellIdentifier")
        }

        let currentGist = presenter.list()[indexPath.row]

        cell.title.text = presenter.title(for: currentGist)
        cell.gistDescription.text = currentGist.description

        presenter.loadImage(for: currentGist.owner.avatarUrl, success: { image in
            if let cellThatRequested = tableView.cellForRow(at: indexPath) as? GistTableViewCell {
                cellThatRequested.avatar.image = image
            }
        }, failure: {error in
            print(error)
        })

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(presenter.list()[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
