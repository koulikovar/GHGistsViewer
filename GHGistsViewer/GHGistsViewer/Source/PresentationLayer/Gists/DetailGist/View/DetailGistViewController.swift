//
//  DetailGistViewController.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import UIKit

class DetailGistViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var gistTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: DetailGistPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(update), for: .valueChanged)
        tableView.refreshControl = refreshControl

        title = "DETAIL_GIST_TITLE".localized

        username.text = presenter.username()
        gistTitle.text = presenter.description()

        presenter.loadAvatar(success: { [weak self] image in
            self?.avatar.image = image
        }, failure: {error in
            print(error)
        })

        update()

        // Do any additional setup after loading the view.
    }

    @objc private func update() {
        presenter.update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DetailGistViewController: DetailGistView {
    func updateTableView() {
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }

    func showError(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL_BUTTON_TITLE".localized, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "REFRESH_BUTTON_TITLE".localized, style: .default, handler: { [weak self] action in
            self?.presenter.update()
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func push(_ view: FileViewer) {
        navigationController?.pushViewController(view as! UIViewController, animated: true)
    }
}

extension DetailGistViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "DETAIL_GIST_FILES_LIST_TITLE".localized
        case 1:
            return "DETAIL_GIST_COMMITS_TITLE".localized
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter.files().count
        case 1:
            return presenter.commits().count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GistInfoCellIdentifier") else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: "GistInfoCellIdentifier")
            }
            return cell
        }()

        if indexPath.section == 0 {
            cell.textLabel?.text = presenter.files()[indexPath.row].name
        }
        else {
            let commit = presenter.commits()[indexPath.row]
            cell.textLabel?.text = commit.version
            cell.detailTextLabel?.text = presenter.status(for: commit)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            presenter.didSelect(presenter.files()[indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
