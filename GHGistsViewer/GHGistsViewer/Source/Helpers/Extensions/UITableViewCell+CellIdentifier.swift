//
//  UITableViewCell+CellIdentifier.swift
//  GHGistsViewer
//
//  Created by Artem Kulikov on 17.06.2018.
//  Copyright © 2018 Your Mother Lover. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}
