//
//  CommitStatus.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

struct CommitStatus: Decodable {
    let additions: Int
    let deletions: Int
}
