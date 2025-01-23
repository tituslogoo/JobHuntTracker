//
//  ApplicationInputViewModel.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 21/01/25.
//

import Foundation
import UIKit

protocol ApplicationInputViewModelProcotol {
    var companyTextFieldData: IconTextFieldData { get }
    var positionTextFieldData: IconTextFieldData { get }
    var locationTextFieldData: IconTextFieldData { get }
}

final class ApplicationInputViewModel: ApplicationInputViewModelProcotol {
    var companyTextFieldData: IconTextFieldData
    var positionTextFieldData: IconTextFieldData
    var locationTextFieldData: IconTextFieldData
    
    init(input: ApplicationInputViewModelInput) {
        companyTextFieldData = input.companyTextFieldData
        positionTextFieldData = input.positionTextFieldData
        locationTextFieldData = input.locationTextFieldData
    }
}
