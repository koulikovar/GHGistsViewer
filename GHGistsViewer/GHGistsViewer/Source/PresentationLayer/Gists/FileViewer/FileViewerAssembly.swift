//
//  FileViewerAssembly.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

final class FileViewerAssembly: Assembly {
    let view: FileViewer

    init(router: Router, dataProvider: DataProvider<File>) {
        self.view = FileViewController()
        let presenter = FileViewerPresenter(router: router, view: view, dataProvider: dataProvider)
        self.view.presenter = presenter
    }
}
