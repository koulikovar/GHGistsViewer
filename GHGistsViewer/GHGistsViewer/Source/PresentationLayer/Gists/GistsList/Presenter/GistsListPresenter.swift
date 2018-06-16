//
//  GistsListPresenter.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

final class GistsListPresenter: GistsListPresenterProtocol {
    private weak var view: GistsListView?
    private let networkService: NetworkService

    init(view: GistsListView, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }


}
