//
//  FileViewer.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

protocol FileViewer: AnyObject {
    var presenter: FileViewerPresenterProtocol! { get set }
}
