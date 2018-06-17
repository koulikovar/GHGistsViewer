//
//  FileViewController.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import UIKit

class FileViewController: UIViewController, FileViewer {
    @IBOutlet weak var content: UILabel!

    var presenter: FileViewerPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = presenter.title()
        content.text = presenter.content()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
