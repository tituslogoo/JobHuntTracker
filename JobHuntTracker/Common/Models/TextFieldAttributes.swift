//
//  TextFieldAttributes.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 23/01/25.
//

import Foundation
import UIKit

final class TextFieldAttributes {
    let font: UIFont
    let placeholderColor: UIColor
    let backgroundColor: UIColor
    let textColor: UIColor
    let returnType: UIReturnKeyType
    
    convenience init() {
        self.init(
            font: FontTool.roboto(withSize: 16.0) ?? .systemFont(ofSize: 16.0),
            placeholderColor: ColorTool.lightPrimary,
            backgroundColor: ColorTool.lightPrimary,
            textColor: ColorTool.darkPrimary,
            returnType: .next
        )
    }
    
    init(
        font: UIFont,
        placeholderColor: UIColor,
        backgroundColor: UIColor,
        textColor: UIColor,
        returnType: UIReturnKeyType
    ) {
        self.font = font
        self.placeholderColor = placeholderColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.returnType = returnType
    }
}
