//
//  DataProvider.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

final class DataProvider<Model: Decodable> {
    var data: Model?
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func updateData(_ request: NetworkRequest, success: @escaping () -> (), failure: @escaping (String) -> ()) {
        networkService.perform(request, success: { [weak self] response in
            guard let data = ModelMaker.make(with: response, of: Model.self) else {
                failure("JSON_DECODE_ERROR".localized)
                return
            }
            self?.data = data
            success()
            }, failure: { error in
                failure(error.message)
        })
    }
}
