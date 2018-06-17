//
//  Router.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

final class Router {
    lazy var gistsListView: GistsListView = {
        let dataProvider = DataProvider<[Gist]>(networkService: networkService)
        return GistsListAssembly(router: self, dataProvider: dataProvider).view
    }()
    let imageProvider: ImageProvider
    
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
        self.imageProvider = ImageProvider(networkService: networkService)
    }

    func detailGistView(for gist: Gist) -> DetailGistView {
        let dataProvider = DataProvider<Gist>(networkService: networkService)
        dataProvider.data = gist

        return DetailGistAssembly(router: self, dataProvider: dataProvider).view
    }
}
