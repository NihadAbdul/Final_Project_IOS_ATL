//
//  SignInViewController.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInViewController: UIViewController{
    
    private let containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 24))
        return sv
    }()
    private let forgetPasswordStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 4))
        return sv
    }()
    private let formStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8))
        return sv
    }()
    private let buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 24))
        return sv
    }()
    private let thirdPartiesButtonStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8))
        return sv
    }()
    private let signupStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 4, alignment: .center ,distribution: .fill))
        return sv
    }()
    private let pageHeaderTitle: CustomPageHeader = {
        let header = CustomPageHeader()
        header.configure(.init(title: "Sign in", description: "Welcome back, please enter your details"))
        return header
    }()
    private let emailField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Email", placeholder: "Enter your email", image: .leading, leadingImageName: "phone", trailingImageName: nil))
        tf.inputTextField.autocapitalizationType = .none
        return tf
    }()
    private let passwordField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Password", placeholder: "Enter your password ", image: .both, leadingImageName: "lock-01", trailingImageName: "eye-off"))
        tf.inputTextField.autocapitalizationType = .none
        return tf
    }()
    private let forgetPasswordButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Forget password?", type: .tertiary))
        return button
    }()
    private lazy var signinButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Sign in", type: .primary))
        button.addTarget(self, action: #selector(didTapSigninButton), for: .touchUpInside)
        return button
    }()
    private let seperatorView: CustomSeparator = {
        let sv = CustomSeparator()
        return sv
    }()
    private let signinWithGoogleButton: CustomThirdPartiesButton = {
        let button = CustomThirdPartiesButton()
        button.configure(.init(title: "Sign in with Google", image: "google"))
        return button
    }()
    private let signinWithAppleButton: CustomThirdPartiesButton = {
        let button = CustomThirdPartiesButton()
        button.configure(.init(title: "Sign in with Apple", image: "apple"))
        return button
    }()
    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.applyInformativeTitle()
        label.text = "Don’t have an account?"
        return label
    }()
    private lazy var signupButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Sign Up", type: .tertiary))
        button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        return button
    }()
    @objc
    private func didTapSigninButton(){
        guard let email = emailField.inputTextField.text, !email.isEmpty else {
            self.showAlert(title: "Validation failed", message: "Email can not be empty")
            return
        }
        guard let password = passwordField.inputTextField.text, !password.isEmpty else {
            self.showAlert(title: "Validation failed", message: "Password can not be empty")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authDataResult, error in
            if let error = error as? NSError{
                switch AuthErrorCode.Code(rawValue: error.code){
                default:
                    self?.showAlert(title: "Something went wrong", message: error.localizedDescription)
                    return
                }
            }
            UserDefaults.standard.set(true, forKey: "UserAlreadySignedIn")
            let tabBar = TabbarController()
            self?.navigationController?.setViewControllers([tabBar], animated: true)
        }
       
    }
    @objc
    private func didTapSignUpButton(){
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        configuratedConstraints()
        self.navigationController?.navigationBar.isHidden = true
        
        if UserDefaults.standard.bool(forKey: "UserAlreadySignedIn") == true{
            let tabBar = TabbarController()
            self.navigationController?.pushViewController(tabBar, animated: false)
        }

    }

    private func setup(){
        view.addSubview(containerStackView)
        view.addSubview(signupStackView)
        
        [
            pageHeaderTitle,
            formStackView,
            buttonStackView
        ].forEach(containerStackView.addArrangedSubview)
        
        [
            emailField,
            passwordField,
            forgetPasswordStackView
        ].forEach(formStackView.addArrangedSubview)
        
        [
            UIView(),
            UIView(),
            forgetPasswordButton,
        ].forEach(forgetPasswordStackView.addArrangedSubview)
        [
            signinButton,
            seperatorView,
            thirdPartiesButtonStackView
        ].forEach(buttonStackView.addArrangedSubview)
            
        [
            signinWithGoogleButton,
            signinWithAppleButton
        ].forEach(thirdPartiesButtonStackView.addArrangedSubview)
        [
            haveAccountLabel,
            signupButton
        ].forEach(signupStackView.addArrangedSubview)
    }
    private func configuratedConstraints(){
        containerStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        forgetPasswordButton.snp.updateConstraints { make in
            make.height.equalTo(24)
        }
        signupStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
