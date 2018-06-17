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
        case description
        case owner
        case files
        case commits = "history"
    }

    let id: String
    let description: String?
    let owner: User
    let files: [String: File]
    let commits: [Commit]?
}

extension Gist {
    static var undefined: Gist {
        return Gist(id: "",
                    description: nil,
                    owner: User(id: 0, login: "", avatarUrl: ""),
                    files: [:],
                    commits: [])
    }
}
