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

struct IconTextFieldData {
    let placeholderTitle: String
    let image: UIImage?
    let textFieldAttributes: TextFieldAttributes
}

final class IconTextfieldView: UIView {
    // Right now only supports Minoru Format
    private let defaultIconSize: CGSize = CGSize(width: 25.0, height: 25.0)
    
    // MARK: UI
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [imageContainerView, textField])
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        
        return stackView
    }()
    
    private lazy var imageContainerView: UIView = {
        let view: UIView = UIView()
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        return imageView
    }()
    
    private lazy var textField: MinoruTextField = {
        let textField: MinoruTextField = MinoruTextField()
        textField.placeholder = NSLocalizedString(data.placeholderTitle, comment: "")
        textField.font = data.textFieldAttributes.font
        textField.placeholderColor = data.textFieldAttributes.placeholderColor
        textField.backgroundColor = data.textFieldAttributes.backgroundColor
        textField.textColor = data.textFieldAttributes.textColor
        textField.returnKeyType = data.textFieldAttributes.returnType
        textField.delegate = delegate
        
        return textField
    }()
    
    // MARK: Properties
    let data: IconTextFieldData
    var image: UIImage
    weak var delegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }
    
    init(
        data: IconTextFieldData,
        delegate: UITextFieldDelegate? = nil
    ) {
        self.data = data
        self.image = data.image ?? UIImage()
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
        
        imageContainerView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(defaultIconSize)
            make.height.equalTo(iconImageView.snp.width)
            make.leading.trailing.equalToSuperview()
        }
    }
}
