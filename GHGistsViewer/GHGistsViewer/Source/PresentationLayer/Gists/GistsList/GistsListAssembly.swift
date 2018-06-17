//
//  GistsListAssembly.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

final class GistsListAssembly: Assembly {
    let view: GistsListView

    init(router: Router, dataProvider: DataProvider<[Gist]>) {
        self.view = GistsListViewController()
        let presenter = GistsListPresenter(router: router, view: view, dataProvider: dataProvider)
        self.view.presenter = presenter
    }
}
