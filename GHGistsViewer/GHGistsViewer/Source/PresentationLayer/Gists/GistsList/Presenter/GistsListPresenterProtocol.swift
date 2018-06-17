//
//  GistsListPresenterProtocol.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import UIKit

protocol GistsListPresenterProtocol {
    typealias ImageLoadingSuccess = (UIImage) -> ()
    typealias ImageLoadingFailure = (String) -> ()

    var list: [Gist] { get }

    init(router: Router, view: GistsListView, dataProvider: DataProvider<[Gist]>)

    func didSelect(_ gist: Gist)
    func updateList()
    func loadImage(for url: String,
                   success: @escaping ImageLoadingSuccess,
                   failure: @escaping ImageLoadingFailure)

}
