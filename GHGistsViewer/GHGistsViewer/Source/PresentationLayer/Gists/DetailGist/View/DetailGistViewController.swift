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

    var presenter: DetailGistPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "DETAIL_GIST_TITLE".localized

        username.text = presenter.gist.owner.login
        gistTitle.text = presenter.gist.title

        presenter.loadImage(for: presenter.gist.owner.avatarUrl, success: { [weak self] image in
            self?.avatar.image = image
        }, failure: {error in
            assertionFailure(error)
            print(error)
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DetailGistViewController: DetailGistView {
    
}
