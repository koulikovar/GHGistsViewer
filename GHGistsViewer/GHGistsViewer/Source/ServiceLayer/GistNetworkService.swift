//
//  GistNetworkService.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 15.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

final class GistNetworkService: NetworkService {
    func perform(_ request: NetworkRequest,
                 success: @escaping NetworkService.NetworkServiceRequestSuccess,
                 failure: @escaping NetworkService.NetworkServiceRequestFailure) throws {
        let urlRequest = try makeUrlRequest(from: request)
    }

    private func makeUrlRequest(from request: NetworkRequest) throws -> URLRequest {
        guard let url = URL(string: request.url) else {
            throw NetworkError.invalidRequest
        }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = request.method.rawValue

        return urlRequest
    }
}
