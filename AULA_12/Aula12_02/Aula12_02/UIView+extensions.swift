//
//  UIView+extensions.swift
//  Aula12_02
//
//  Created by SP11793 on 23/03/22.
//

import Foundation
import UIKit

extension UIView {
    
    public func addSubViews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
