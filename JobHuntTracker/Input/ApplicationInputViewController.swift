//
//  ApplicationInputViewController.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 17/01/25.
//

import Foundation
import SnapKit
import UIKit
import TextFieldEffects

final class ApplicationInputViewController: UIViewController {
    private let defaultHorizontalSpacer: CGFloat = 16.0
    private let defaultTextfieldHeight: CGFloat = 40.0
    
    // MARK: UI
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = NSLocalizedString("label.title.input-main", comment: "")
        label.font = FontTool.roboto(ofType: .semiBold, withSize: 24.0)
        label.textColor = ColorTool.textLightPrimary
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8.0
        return stackView
    }()
    
    private lazy var companyNameTextFieldView: IconTextfieldView = {
        let textField: IconTextfieldView = IconTextfieldView(
            attributes: viewModel.textFieldAttributes,
            image: UIImage(named: "ic-company"),
            delegate: self
        )
        
        return textField
    }()
    
    private lazy var positionTextField: MinoruTextField = {
        let textField: MinoruTextField = MinoruTextField()
        textField.placeholder = NSLocalizedString("label.placeholder.position", comment: "")
        textField.font = FontTool.roboto(withSize: 16.0)
        textField.placeholderColor = ColorTool.lightPrimary
        textField.backgroundColor = ColorTool.lightPrimary
        textField.textColor = ColorTool.darkPrimary
        textField.returnKeyType = .next
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var locationTextField: MinoruTextField = {
        let textField: MinoruTextField = MinoruTextField()
        textField.placeholder = NSLocalizedString("label.placeholder.location", comment: "")
        textField.font = FontTool.roboto(withSize: 16.0)
        textField.placeholderColor = ColorTool.lightPrimary
        textField.backgroundColor = ColorTool.lightPrimary
        textField.textColor = ColorTool.darkPrimary
        textField.returnKeyType = .next
        textField.delegate = self
        
        return textField
    }()
    
    // MARK: Properties
    private var viewModel: ApplicationInputViewModelProcotol
    
    // MARK: Init
    init(viewModel: ApplicationInputViewModelProcotol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: Private Functions
private extension ApplicationInputViewController {
    func setupViews() {
        view.backgroundColor = ColorTool.defaultBackground
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        
        setupStackView()
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            make.leading.equalToSuperview().inset(defaultHorizontalSpacer)
            make.trailing.equalToSuperview().inset(defaultHorizontalSpacer)
        }
        
        stackView.addArrangedSubview(companyNameTextFieldView)
        companyNameTextFieldView.snp.makeConstraints { make in
            make.height.equalTo(defaultTextfieldHeight)
        }
        
        stackView.addArrangedSubview(positionTextField)
        positionTextField.snp.makeConstraints { make in
            make.height.equalTo(defaultTextfieldHeight)
        }
        
        stackView.addArrangedSubview(locationTextField)
        locationTextField.snp.makeConstraints { make in
            make.height.equalTo(defaultTextfieldHeight)
        }
    }
}

// MARK: UITextFieldDelegate
extension ApplicationInputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == companyNameTextFieldView {
            positionTextField.becomeFirstResponder()
        }
        return true
    }
}
