//
//  File.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

struct File: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "filename"
        case content
    }
    let name: String
    let content: String?
}
