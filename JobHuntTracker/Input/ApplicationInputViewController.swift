//
//  ApplicationInputViewController.swift
//  JobHuntTracker
//
//  Created by Titus Logo on 17/01/25.
//

import Foundation
import SnapKit
import UIKit

final class ApplicationInputViewController: UIViewController {
    private let defaultHorizontalSpacer: CGFloat = 16.0
    
    // MARK: UI
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = NSLocalizedString("label.title.input-main", comment: "")
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = ColorTool.textLightPrimary
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8.0
        return stackView
    }()
    
    private lazy var companyNameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: NSLocalizedString("label.placeholder.company-name", comment: ""),
            attributes: [.foregroundColor: ColorTool.textPlaceholder]
        )
        
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 16.0)
        textField.textColor = ColorTool.textLightPrimary
        textField.returnKeyType = .next
        
        return textField
    }()
    
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
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalToSuperview().inset(defaultHorizontalSpacer)
            make.trailing.equalToSuperview().inset(defaultHorizontalSpacer)
        }
        
        stackView.addArrangedSubview(companyNameTextField)
    }
}
