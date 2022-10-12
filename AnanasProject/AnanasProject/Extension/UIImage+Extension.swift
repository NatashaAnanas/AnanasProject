//
//  UIImage+Extension.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 12.10.2022.
//

import UIKit
/// Расширение для UIImage
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image {_ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
