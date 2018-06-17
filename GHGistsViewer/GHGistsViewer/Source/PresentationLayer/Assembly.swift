//
//  Assembly.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

protocol Assembly {
    associatedtype View
    associatedtype Model: Decodable
    var view: View { get }

    init(router: Router, dataProvider: DataProvider<Model>)
}
