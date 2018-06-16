//
//  GistsListViewController.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import UIKit

class GistsListViewController: UIViewController, GistsListView {
    @IBOutlet weak var tableView: UITableView!

    var presenter: GistsListPresenterProtocol!

    private var gists = [Gist]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "GISTS_LIST_VC_TITLE".localized

        presenter.updateList()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTableView(with gists: [Gist]) {
        self.gists = gists
        tableView.reloadData()
    }

    func showError(message: String) {
        print(message)
    }
}

extension GistsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "GistsListCellIdentifier")

        cell.textLabel?.text = gists[indexPath.row].title

        return cell
    }
}
