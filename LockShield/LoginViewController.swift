//
//  ViewController.swift
//  LockShield
//
//  Created by Shakir Kadirov on 25.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var topTitleLabel: UILabel = {
        $0.text = "LockShield: Безопасная Авторизация"
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var descriptionLabel: UILabel = {
        $0.text = "Добро пожаловать в LockShield - ваш надежный щит в мире цифровой безопасности. Надежная и легкая авторизация для вашего комфорта. Обеспечьте защиту своего аккаунта с LockShield и наслаждайтесь безопасным входом в ваш личный кабинет."
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var emailTextField: UITextField = {
        $0.delegate = self
        $0.tag = 1
        $0.placeholder = "Email"
        $0.backgroundColor = .white
        $0.leftViewMode = .always
        $0.leftView = ofsetView()
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    lazy var passwordTextField: UITextField = {
        $0.delegate = self
        $0.tag = 2
        $0.placeholder = "Password"
        $0.backgroundColor = .white
        $0.leftViewMode = .always
        $0.leftView = ofsetView()
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    lazy var loginButton: UIButton = {
        $0.setTitle("Войти", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(openedHomepage), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    lazy var singUpButton: UIButton = {
        $0.setTitle("Новый пользователь?", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.addTarget(self, action: #selector(openRegistration), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    lazy var forgotPasswordButton: UIButton = {
        $0.setTitle("Забыли пароль?", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.addTarget(self, action: #selector(openForgetPassword), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
        view.backgroundColor = .systemGray2
        view.addSubview(topTitleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(singUpButton)
        view.addSubview(forgotPasswordButton)
        
        setConstraints()
    }
    
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            topTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            topTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            descriptionLabel.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            singUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            singUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            singUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            forgotPasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func ofsetView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 50)
        return view
    }
    
    @objc func openedHomepage(){
        let homeVC = HomeViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    @objc func openRegistration() {
        let registerVC = SingUpViewController()
        let navigationController = UINavigationController(rootViewController: registerVC)
        navigationController.modalTransitionStyle = .coverVertical
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @objc func openForgetPassword() {
        let registerVC = ForgetPasswordViewController()
        let navigationController = UINavigationController(rootViewController: registerVC)
        navigationController.modalTransitionStyle = .coverVertical
        self.present(navigationController, animated: true, completion: nil)
    }
}


extension LoginViewController {
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(LoginViewController.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}


extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 1 {
            print("this is email TF [sybmol: \(string) text: \(textField.text ?? "")]")
        } else if textField.tag == 2 {
            print("this is emaipasswordl TF [sybmol: \(string) text: \(textField.text ?? "")]")
        }
       
        return true
    }
    
}
