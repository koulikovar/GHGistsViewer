//
//  NetworkService.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 15.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

protocol NetworkService {
    typealias NetworkServiceRequestSuccess = () -> Void
    typealias NetworkServiceRequestFailure = (_ : NetworkError) -> Void

    func perform(_ request: NetworkRequest,
                 success: @escaping NetworkServiceRequestSuccess,
                 failure: @escaping NetworkServiceRequestFailure) throws
}
