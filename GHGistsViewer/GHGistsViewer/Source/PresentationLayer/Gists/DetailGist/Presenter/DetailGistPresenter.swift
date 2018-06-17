//
//  DetailGistPresenter.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

final class DetailGistPresenter: DetailGistPresenterProtocol {
    private weak var view: DetailGistView?
    private let dataProvider: DataProvider<Gist>
    private let router: Router

    init(router: Router, view: DetailGistView, dataProvider: DataProvider<Gist>) {
        self.view = view
        self.dataProvider = dataProvider
        self.router = router
    }

    func title() -> String {
        return gist().title
    }

    func username() -> String {
        return gist().owner.login
    }

    func files() -> [File] {
        return gist().files.map { $0.value}
    }

    func commits() -> [Commit] {
        guard let commits = gist().commits else {
            return []
        }
        return commits
    }

    func update() {
        dataProvider.updateData(GistRequest.detail(gistId: gist().id), success: {
            DispatchQueue.main.async {
                self.view?.updateTableView()
            }
        }, failure: {error in
            DispatchQueue.main.async {
                self.view?.showError(message: error)
            }
        })
    }

    func didSelect(_ file: File) {
        let fileViewer = router.fileViewer(for: file)
        view?.push(fileViewer)
    }

    func loadAvatar(success: @escaping DetailGistPresenterProtocol.ImageLoadingSuccess, failure: @escaping DetailGistPresenterProtocol.ImageLoadingFailure) {
        router.imageProvider.loadImage(from: gist().owner.avatarUrl, success: { image in
            DispatchQueue.main.async {
                success(image)
            }
        }, failure: { error in
            DispatchQueue.main.async {
                failure(error)
            }
        })
    }

    private func gist() -> Gist {
        guard let gist = dataProvider.data else {
            return Gist.undefined
        }
        return gist
    }
}
