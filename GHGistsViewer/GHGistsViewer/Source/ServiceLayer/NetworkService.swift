//
//  NetworkService.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 15.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

protocol NetworkService {
    typealias NetworkServiceRequestSuccess = (_: Data) -> Void
    typealias NetworkServiceRequestFailure = (_: NetworkError) -> Void

    init(session: URLSession)

    func perform(_ request: NetworkRequest,
                 success: @escaping NetworkServiceRequestSuccess,
                 failure: @escaping NetworkServiceRequestFailure)
}
