//
//  DetailGistPresenterProtocol.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import UIKit

protocol DetailGistPresenterProtocol {
    typealias ImageLoadingSuccess = (UIImage) -> ()
    typealias ImageLoadingFailure = (String) -> ()

    var gist: Gist { get }

    init(router: Router, view: DetailGistView, dataProvider: DataProvider<Gist>)

    func loadImage(for url: String,
                   success: @escaping ImageLoadingSuccess,
                   failure: @escaping ImageLoadingFailure)
}
