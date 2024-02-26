//
//  ForgetPasswordViewController.swift
//  LockShield
//
//  Created by Shakir Kadirov on 25.02.2024.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    lazy var instructionLabel: UILabel = {
        $0.text = "Введите свой адрес электронной почты, и мы вышлем вам ОТП код для восстановления пароля."
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var emailTextField: UITextField = {
        $0.placeholder = "Email"
        $0.backgroundColor = .white
        $0.leftViewMode = .always
        $0.leftView = ofsetView()
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    //Получить ОТП код
    
    lazy var sendOtpCodeButton: UIButton = {
        $0.setTitle("Войти", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(sendOtpCode), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        
        view.addSubview(instructionLabel)
        view.addSubview(emailTextField)
        view.addSubview(sendOtpCodeButton)
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            emailTextField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            sendOtpCodeButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            sendOtpCodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sendOtpCodeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            sendOtpCodeButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
    func ofsetView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 50)
        return view
    }
    
    @objc func sendOtpCode(){
        
    }
}
