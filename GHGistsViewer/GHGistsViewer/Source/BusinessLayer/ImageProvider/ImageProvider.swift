//
//  ImageProvider.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import Foundation
import UIKit

final class ImageProvider {
    private var cache: NSCache<NSString, UIImage>
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
        self.cache = NSCache()
    }

    func loadImage(from url: String, success: @escaping (UIImage) -> (), failure: @escaping (String) -> ()) {
        if let cachedImage = cache.object(forKey: url as NSString) {
            success(cachedImage)
            return
        }
        let imageRequest = ImageRequest(url: url, method: .get)
        networkService.perform(imageRequest, success: { [weak self] imageData in
            guard let image = UIImage(data: imageData) else {
                failure("INVALID_IMAGE_DATA".localized)
                return
            }
            self?.cache.setObject(image, forKey: url as NSString)
            success(image)
        }, failure: { error in
            failure(error.message)
        })
    }
}
