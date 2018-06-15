//
//  NetworkRequest.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 15.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation

enum ResponseDataType {
    case json
    case plainData
}

enum HTTPRequestMethod: String {
    case post = "POST"
    case get = "GET"
}

protocol NetworkRequest {
    var url: String { get }
    var method: HTTPRequestMethod { get }
    var responseType: ResponseDataType { get }
}
