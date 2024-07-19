//
//  SignUpViewController.swift
//  final_project
//
//  Created by Nihad on 03.06.24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController{
    
    private let containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 24))
        return sv
    }()
    private let termsStackView: UIStackView = {
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
    private let signupStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 4, alignment: .center ,distribution: .fill))
        return sv
    }()
    private let pageHeaderTitle: CustomPageHeader = {
        let header = CustomPageHeader()
        header.configure(.init(title: "Sign Up", description: "Welcome back, please enter your details"))
        return header
    }()
    private let nameField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Name", placeholder: "Enter your name", image: .leading, leadingImageName: "user-02", trailingImageName: nil))
        return tf
    }()
    private let surnameField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Surname", placeholder: "Enter your surname", image: .leading, leadingImageName: "user-02", trailingImageName: nil))
        return tf
    }()
    private let emailField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Email", placeholder: "Enter your email", image: .leading, leadingImageName: "user-02", trailingImageName: nil))
        tf.inputTextField.autocapitalizationType = .none
        return tf
    }()
    private let phonenumberField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Phone number", placeholder: "Enter your phone number", image: .leading, leadingImageName: "phone", trailingImageName: nil))
        return tf
    }()
    private let passwordField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Password", placeholder: "Enter your password ", image: .both, leadingImageName: "lock-01", trailingImageName: "eye-off"))
        tf.inputTextField.isSecureTextEntry = true
        return tf
    }()
    private lazy var signupButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Sign up", type: .primary))
        button.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
        return button
    }()
    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.applyInformativeTitle()
        label.text = "Do you have an account?"
        return label
    }()
    private let termsConditionsLabel: UILabel = {
        let label = UILabel()
        label.applyInformativeTitle()
        label.text = "By signin up you agree by our Terms of Services and Privacy Policy"
        label.numberOfLines = 3
        return label
    }()
    private lazy var signinButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Sign in", type: .tertiary))
        button.addTarget(self, action: #selector(didTapSigninButton), for: .touchUpInside)
        return button
    }()
    @objc
    private func didTapSignupButton(){
        guard let name = nameField.inputTextField.text, !name.isEmpty else{
            showAlert(title: "Field error", message: "Name can not be empty")
            return
        }
        guard let surname = surnameField.inputTextField.text, !surname.isEmpty else{
            showAlert(title: "Field error", message: "Surname can not be empty")
            return
        }
        guard let email = emailField.inputTextField.text, !email.isEmpty else{
            showAlert(title: "Field error", message: "Email can not be empty")
            return
        }
        guard let phone = phonenumberField.inputTextField.text, !phone.isEmpty else{
            showAlert(title: "Field error", message: "Phone can not be empty")
            return
        }
        guard let password = passwordField.inputTextField.text, !password.isEmpty else{
            showAlert(title: "Field error", message: "Password can not be empty")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] signInResult, signInError in
            if let error = signInError{
                self?.showAlert(title: "Something went wrong", message: error.localizedDescription)
                return
            }
            let newUserInfo = Auth.auth().currentUser
            if let userId = newUserInfo?.uid{
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["name": name, "surname": surname, "phone": phone, "userId": userId])
            }
            let vc = SuccessViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    @objc
    private func didTapSigninButton(){
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        configuratedConstraints()
    }
    private func setup(){
        view.addSubview(containerStackView)
        view.addSubview(signupStackView)
        
        [
            pageHeaderTitle,
            formStackView,
            termsStackView,
            buttonStackView
        ].forEach(containerStackView.addArrangedSubview)
        
        [
            nameField,
            surnameField,
            emailField,
            phonenumberField,
            passwordField,
        ].forEach(formStackView.addArrangedSubview)
        [
            termsConditionsLabel
        ].forEach(termsStackView.addArrangedSubview)
        [
            signupButton
        ].forEach(buttonStackView.addArrangedSubview)
            
        [
            haveAccountLabel,
            signinButton
        ].forEach(signupStackView.addArrangedSubview)
    }
    private func configuratedConstraints(){
        containerStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        signupStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
