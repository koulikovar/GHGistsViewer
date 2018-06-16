//
//  GistNetworkService.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 15.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

final class GistNetworkService: NetworkService {

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func perform(_ request: NetworkRequest, success: @escaping NetworkServiceRequestSuccess, failure: @escaping NetworkServiceRequestFailure) {
        guard let urlRequest = request.convertedToURLRequest() else {
            failure(NetworkError(message: "NETWORK_URL_ERROR".localized))
            return
        }

        let gistTask = session.dataTask(with: urlRequest) { data, respone, error in
            if let error = error {
                assertionFailure(error.localizedDescription)
                failure(NetworkError(message: error.localizedDescription))
                return
            }
            guard let data = data else {
                assertionFailure("NETWORK_RESPONSE_DATA_ERROR".localized)
                failure(NetworkError(message: "NETWORK_RESPONSE_DATA_ERROR".localized))
                return
            }
            success(data)
        }
        gistTask.resume()
    }
}
