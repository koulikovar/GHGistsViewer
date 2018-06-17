//
//  DetailGistPresenter.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

final class DetailGistPresenter: DetailGistPresenterProtocol {
    var gist: Gist {
        guard let gist = dataProvider.data else {
            return Gist.undefined
        }
        return gist
    }

    private weak var view: DetailGistView?
    private let dataProvider: DataProvider<Gist>
    private let router: Router

    init(router: Router, view: DetailGistView, dataProvider: DataProvider<Gist>) {
        self.view = view
        self.dataProvider = dataProvider
        self.router = router
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
}
