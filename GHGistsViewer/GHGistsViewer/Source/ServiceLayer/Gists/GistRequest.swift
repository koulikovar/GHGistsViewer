//
//  GistRequest.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 15.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

enum GistRequest {
    case list
    case detail(gistId: String)
}

extension GistRequest: NetworkRequest {
    var url: String {
        return "\(Config.gistBaseUrl)\(path)"
    }

    var method: NetworkRequestMethod {
        return .get
    }

    private var path: String {
        switch self {
        case .list:
            return "/gists/public"
        case .detail(let gistId):
            return "/gists/\(gistId)"
        }
    }
}
