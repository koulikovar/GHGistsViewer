//
//  GistsListAssembly.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

final class GistsListAssembly {
    let view: GistsListView

    init() {
        self.view = GistsListViewController()
        let presenter = GistsListPresenter(view: view, networkService: GistNetworkService())
        self.view.presenter = presenter
    }
}
