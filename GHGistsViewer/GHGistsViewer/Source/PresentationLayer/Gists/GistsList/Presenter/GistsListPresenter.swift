//
//  GistsListPresenter.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

final class GistsListPresenter: GistsListPresenterProtocol {
    private weak var view: GistsListView?
    private let networkService: NetworkService

    init(view: GistsListView, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }

    func updateList() {
        networkService.perform(GistRequest.list, success: { [weak self] data in
            guard let gists = ModelMaker.make(with: data, of: [Gist].self) else {
                DispatchQueue.main.async {
                    self?.view?.showError(message: "JSON_DECODE_ERROR".localized)
                }
                return
            }
            DispatchQueue.main.async {
                self?.view?.updateTableView(with: gists)
            }
        }, failure: { [weak self] error in
            DispatchQueue.main.async {
                self?.view?.showError(message: error.message)
            }
        })
    }
}
