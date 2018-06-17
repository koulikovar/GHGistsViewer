//
//  FileViewerPresenter.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

final class FileViewerPresenter: FileViewerPresenterProtocol {
    private let router: Router
    private let dataProvider: DataProvider<File>
    private weak var view: FileViewer?

    init(router: Router, view: FileViewer, dataProvider: DataProvider<File>) {
        self.router = router
        self.dataProvider = dataProvider
        self.view = view
    }

    func title() -> String {
        return dataProvider.data?.name ?? ""
    }

    func content() -> String {
        return dataProvider.data?.content ?? ""
    }
}
