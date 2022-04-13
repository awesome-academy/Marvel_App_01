//
//  ReuseableView.swift
//  MarvelApp
//
//  Created by Lê Tiến Đạt on 14/04/2022.
//

import Foundation
import UIKit

protocol ReuseableView {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension ReuseableView {
    static var identifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
