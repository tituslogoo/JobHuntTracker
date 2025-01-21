//
//  IconTextfieldView.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 21/01/25.
//

import Foundation
import SnapKit
import UIKit
import TextFieldEffects

struct IconTextFieldAttributes {
    let placeholderTitle: String
    let font: UIFont
    let placeholderColor: UIColor
    let backgroundColor: UIColor
    let textColor: UIColor
    let returnType: UIReturnKeyType
}

final class IconTextfieldView: UIView {
    // Right now only supports Minoru Format
    
    // MARK: UI
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [iconImageView, textField])
        stackView.axis = .horizontal
        stackView.spacing = 8.0
        
        return stackView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: UIImage(named: "icon_search"))
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var textField: MinoruTextField = {
        let textField: MinoruTextField = MinoruTextField()
        textField.placeholder = NSLocalizedString(attributes.placeholderTitle, comment: "")
        textField.font = attributes.font
        textField.placeholderColor = attributes.placeholderColor
        textField.backgroundColor = attributes.backgroundColor
        textField.textColor = attributes.textColor
        textField.returnKeyType = attributes.returnType
        textField.delegate = delegate
        
        return textField
    }()
    
    // MARK: Properties
    let attributes: IconTextFieldAttributes
    var image: UIImage
    weak var delegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }
    
    init(
        attributes: IconTextFieldAttributes,
        image: UIImage?,
        delegate: UITextFieldDelegate? = nil
    ) {
        self.attributes = attributes
        self.image = image ?? UIImage()
        super.init(frame: .zero)
        self.delegate = delegate
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Functions
private extension IconTextfieldView {
    func setupViews() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.height.equalTo(iconImageView.snp.width)
        }
    }
}
