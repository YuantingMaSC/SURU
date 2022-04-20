//
//  UIImageView+.swift
//  SURU_Leo
//
//  Created by LEO W on 2022/4/19.
//

import Foundation
import UIKit

extension UIImageView {
    func asset(_ name: String) -> UIImageView {
        let view = UIImageView(image: UIImage(named: name))
        return view
    }
}
