//
//  LoginController.swift
//  InstagramClone
//
//  Created by Vadim Kononenko on 30.03.2023.
//

import UIKit
import SnapKit

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var gradient: CAGradientLayer = {
        let grad = CAGradientLayer()
        grad.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        grad.locations = [0, 1]
        grad.frame = view.frame
        return grad
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Instagram_logo_white")
        return imageView
    }()
    
    private let emailTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return btn
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var forgotPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.customAttributedTitle(firstPart: "Forgot your password?", secondPart: "Get help signing in.")
        return btn
    }()
    
    private lazy var dontHaveAccountBtn: UIButton = {
        let btn = UIButton()
        btn.customAttributedTitle(firstPart: "Don't have an account?", secondPart: "Sign up")
        return btn
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    //MARK: - Constraints
    
    private func configure() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.layer.addSublayer(gradient)
        view.addSubview(iconImageView)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginBtn)
        stackView.addArrangedSubview(forgotPasswordBtn)
        
        view.addSubview(dontHaveAccountBtn)
    }
    
    private func setupConstraints() {
        iconImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            $0.centerX.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        emailTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        loginBtn.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        dontHaveAccountBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}
