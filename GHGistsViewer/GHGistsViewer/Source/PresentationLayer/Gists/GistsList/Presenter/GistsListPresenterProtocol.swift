//
//  GistsListPresenterProtocol.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

protocol GistsListPresenterProtocol {
    init(view: GistsListView, networkService: NetworkService)

    func updateList()
}
