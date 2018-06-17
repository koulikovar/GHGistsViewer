//
//  GistsListPresenter.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

final class GistsListPresenter: GistsListPresenterProtocol {
    var list: [Gist] {
        guard let data = dataProvider.data else {
            return []
        }
        return data
    }

    private let router: Router
    private weak var view: GistsListView?
    private let dataProvider: DataProvider<[Gist]>

    init(router: Router, view: GistsListView, dataProvider: DataProvider<[Gist]>) {
        self.view = view
        self.dataProvider = dataProvider
        self.router = router
    }

    func updateList() {
        dataProvider.updateData(GistRequest.list, success: {
            DispatchQueue.main.async {
                self.view?.updateTableView()
            }
        }, failure: { errorDescription in
            DispatchQueue.main.async {
                self.view?.showError(message: errorDescription)
            }
        })
    }

    func loadImage(for url: String, success: @escaping ImageLoadingSuccess, failure: @escaping ImageLoadingFailure) {
        router.imageProvider.loadImage(from: url, success: { image in
            DispatchQueue.main.async {
                success(image)
            }
        }, failure: { error in
            DispatchQueue.main.async {
                failure(error)
            }
        })
    }

    func didSelect(_ gist: Gist) {
        let detailGist = router.detailGistView(for: gist)
        view?.push(detailGist)
    }
}
