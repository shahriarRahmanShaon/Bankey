//
//  ViewController.swift
//  Bankey
//
//  Created by sergio shaon on 13/4/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject{
    func didLogin()
}

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String?{
        return loginView.userNameTextField.text
    }
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    weak var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
}

extension LoginViewController{
    
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    private func layout(){
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Login view constraints
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 3)
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
            // it works in both the ways.. hurrah, try any of those
            
        ])
        // singIn button constratint
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 3),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        // error label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController{
    
    @objc func signInTapped(sender: UIButton){
        
        errorMessageLabel.isHidden = true
        login()
    }
    private func login(){
        
        guard let username = username, let password = password else{
            assertionFailure("Username and Password can never be nil")
            return
        }
        if username.isEmpty || password.isEmpty{
            configureView(withMessage: "Username and Password can never be empty")
            return 
        }
        if username == "Sergio" && password == "Ungabunga"{
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }else{
            configureView(withMessage: "Incorrect credentials")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }

}


