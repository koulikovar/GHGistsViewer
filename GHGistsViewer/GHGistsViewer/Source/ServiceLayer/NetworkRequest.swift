//
//  NetworkRequest.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 15.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

enum NetworkRequestMethod: String {
    case post = "POST"
    case get = "GET"
}

protocol NetworkRequest {
    var url: String { get }
    var method: NetworkRequestMethod { get }
}

extension NetworkRequest {
    func convertedToURLRequest() -> URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}
