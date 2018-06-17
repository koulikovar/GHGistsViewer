//
//  DetailGistAssembly.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

final class DetailGistAssembly: Assembly {
    let view: DetailGistView

    init(router: Router, dataProvider: DataProvider<Gist>) {
        self.view = DetailGistViewController()
        let presenter = DetailGistPresenter(router: router, view: view, dataProvider: dataProvider)
        self.view.presenter = presenter
    }
}
