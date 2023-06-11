//
//  LoginScreenVC.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 11/06/2023.
//

import UIKit
import Combine
import DevToolsLocalization

class LoginScreenVC: UIViewController {
    
    // MARK: Properties
    
    /// Public
    @IBOutlet weak var usernameField: RuntimeLocalizedTextField!
    @IBOutlet weak var passwordField: RuntimeLocalizedTextField!
    
    /// Private
    private let viewModel: any LoginScreenVM
    private var bag = Set<AnyCancellable>()
    
    // MARK: Overriden methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        startup()
    }
    
    // MARK: Init
    
    init?(coder: NSCoder, viewModel: any LoginScreenVM) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print(":)")
    }
    
    @IBAction func onLoginTap(_ sender: RuntimeLocalizedButton) {
        viewModel.onAuthTapped()
    }
    
}

// MARK: Private methods

extension LoginScreenVC {
    private func startup() {
        observeViewModel()
        setupTextFieldInputViews()
    }
    
    private func observeViewModel() {
        viewModel.inputFieldStatePublisher.receive(on: DispatchQueue.main).sink { [weak self] state in
            self?.handleInputFieldStateChange(state: state)
        }.store(in: &bag)
    }
    
    private func handleInputFieldStateChange(state: [LoginScreenInputField: LoginScreenInputFieldState]) {
        LoginScreenInputField.allCases.forEach { field in
            let fieldState = state[field]!
            let textFieldView = getTextField(type: field)
            print(field, " is in state: ", fieldState)
        }
    }
    
    private func getTextField(type: LoginScreenInputField) -> RuntimeLocalizedTextField {
        switch type {
        case .username:
            return usernameField
        case .password:
            return passwordField
        }
    }
    
    private func getTextFieldType(field: UITextField) -> LoginScreenInputField {
        if field === self.usernameField {
            return .username
        } else if field === self.passwordField {
            return .password
        } else {
            fatalError()
        }
    }
    
    private func setupTextFieldInputViews() {
        LoginScreenInputField.allCases.forEach { field in
            let textFieldView = getTextField(type: field)
            textFieldView.delegate = self
        }
    }
}

// MARK: UITextFieldDelegate

extension LoginScreenVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        let type = getTextFieldType(field: textField)
        viewModel.onTextFieldInputChanged(type: type, input: newText)
        return true
    }
}
