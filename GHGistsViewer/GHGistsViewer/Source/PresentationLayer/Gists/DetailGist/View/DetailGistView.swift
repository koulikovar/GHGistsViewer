//
//  DetailGistView.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

protocol DetailGistView: AnyObject {
    var presenter: DetailGistPresenterProtocol! { get set }

    func updateTableView()
    func showError(message: String)
    func push(_ view: FileViewer)
}
