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
        case files
        case commits = "history"
    }

    let id: String
    let title: String
    let owner: User
    let files: [String: File]
    let commits: [Commit]?
}

extension Gist {
    static var undefined: Gist {
        return Gist(id: "",
                    title: "undefined",
                    owner: User(id: 0, login: "", avatarUrl: ""),
                    files: [:],
                    commits: [])
    }
}
