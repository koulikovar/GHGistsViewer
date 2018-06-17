//
//  DetailGistPresenterProtocol.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import UIKit

protocol DetailGistPresenterProtocol {
    typealias ImageLoadingSuccess = (UIImage) -> ()
    typealias ImageLoadingFailure = (String) -> ()

    init(router: Router, view: DetailGistView, dataProvider: DataProvider<Gist>)

    func description() -> String
    func username() -> String
    func files() -> [File]
    func commits() -> [Commit]
    func status(for commit: Commit) -> String
    func update()
    func didSelect(_ file: File)
    func loadAvatar(success: @escaping ImageLoadingSuccess, failure: @escaping ImageLoadingFailure)
}
