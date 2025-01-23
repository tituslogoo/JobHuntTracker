//
//  ApplicationInputViewModelInput.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 23/01/25.
//

import Foundation
import UIKit

struct ApplicationInputViewModelInput {
    let companyTextFieldData: IconTextFieldData
    let positionTextFieldData: IconTextFieldData
    let locationTextFieldData: IconTextFieldData
    
    init(
        companyTextFieldData: IconTextFieldData? = nil,
        positionTextFieldData: IconTextFieldData? = nil,
        locationTextFieldData: IconTextFieldData? = nil
    ) {
        self.companyTextFieldData = companyTextFieldData
        ?? IconTextFieldData(
            placeholderTitle: NSLocalizedString("label.placeholder.position", comment: ""),
            image: UIImage(named: "ic-office")?.withTintColor(ColorTool.lightPrimary),
            textFieldAttributes: TextFieldAttributes()
        )
        
        self.positionTextFieldData = positionTextFieldData
        ?? IconTextFieldData(
            placeholderTitle: NSLocalizedString("label.placeholder.position", comment: ""),
            image: UIImage(named: "ic-job")?.withTintColor(ColorTool.lightPrimary),
            textFieldAttributes: TextFieldAttributes()
        )
        
        self.locationTextFieldData = locationTextFieldData
        ?? IconTextFieldData(
            placeholderTitle: NSLocalizedString("label.placeholder.location", comment: ""),
            image: UIImage(named: "ic-location")?.withTintColor(ColorTool.lightPrimary),
            textFieldAttributes: TextFieldAttributes()
        )
    }
}
