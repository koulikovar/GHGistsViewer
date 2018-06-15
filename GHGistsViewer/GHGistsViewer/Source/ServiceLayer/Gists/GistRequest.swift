//
//  GistRequest.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 15.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

enum GistRequest: NetworkRequest {
    case list
    case detail(gistId: String)

    var url: String {
        return "\(Config.gistBaseUrl)\(path)"
    }

    var method: HTTPRequestMethod {
        return .get
    }

    var responseType: ResponseDataType {
        return .json
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
