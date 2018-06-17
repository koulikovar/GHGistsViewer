//
//  Commit.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

struct Commit: Decodable {
    enum CodingKeys: String, CodingKey {
        case version
        case status = "change_status"
    }

    let version: String
    let status: CommitStatus
}
