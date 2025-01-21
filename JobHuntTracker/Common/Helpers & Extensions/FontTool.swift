//
//  FontTool.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 21/01/25.
//

import Foundation
import UIKit

public enum RobotoFontType: String {
    case regular = "Roboto-Regular"
    case semiBold = "Roboto-SemiBold"
    case italic = "Roboto-Italic"
}

public final class FontTool {
    static func roboto(
        ofType type: RobotoFontType = .regular,
        withSize size: CGFloat
    ) -> UIFont? {
        guard let customFont = UIFont(
            name: type.rawValue,
            size: size
        ) else {
            print("Failed to load the font: \(type.rawValue)")
            return nil
        }
        return customFont
    }
}
