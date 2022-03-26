//
//  UIView+Extension.swift
//  DesafioAula15_01
//
//  Created by SP11793 on 25/03/22.
//

import UIKit

extension UIView {
    public func addSubViews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
