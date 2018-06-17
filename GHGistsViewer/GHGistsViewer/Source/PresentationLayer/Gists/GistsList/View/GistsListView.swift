//
//  GistsListView.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

protocol GistsListView: AnyObject {
    var presenter: GistsListPresenterProtocol! { get set }

    func updateTableView()
    func push(_ view: DetailGistView)
    func showError(message: String)
}
