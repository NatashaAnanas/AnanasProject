//
//  UIITextView+Extension.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 09.10.2022.
//

import UIKit
/// Расширение для UILabel
extension UILabel {
    func labelColorChange(For givenText: NSString,
                          into color: UIColor,
                          from locationNumber: Int,
                          to length: Int) {
        
        let myString: NSString = givenText
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(string: myString as String,
                                                    attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica",
                                                                                                     size: 13.5) ?? ""])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor,
                                     value: color,
                                     range: NSRange(location: locationNumber, length: length))
        self.attributedText = myMutableString
    }
}
