//
//  Gist.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 16.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

struct Gist: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title = "description"
        case owner
    }

    let id: String
    let title: String
    let owner: User
}
