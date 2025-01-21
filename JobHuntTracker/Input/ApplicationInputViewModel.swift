//
//  ApplicationInputViewModel.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 21/01/25.
//

import Foundation

protocol ApplicationInputViewModelProcotol {
    var textFieldAttributes: IconTextFieldAttributes { get }
}

final class ApplicationInputViewModel: ApplicationInputViewModelProcotol {
    var textFieldAttributes: IconTextFieldAttributes
    
    
}
