//
//  ModelMaker.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

final class ModelMaker {
    static func make<M: Decodable>(with data: Data, of type: M.Type) -> M? {
        return try? JSONDecoder().decode(type, from: data)
    }
}
