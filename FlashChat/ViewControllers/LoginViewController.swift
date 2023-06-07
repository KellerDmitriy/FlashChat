//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Келлер Дмитрий on 04.06.2023.
//

import UIKit
import Firebase

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: "Warning!", message: e.localizedDescription, preferredStyle: .alert)
                    
                    let OkAction = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
                        self?.passwordTextField.text = ""
                    }
                    alert.addAction(OkAction)
                    self?.present(alert, animated: true)
                    return
                } else {
                    //Navigate to the ChatVController
                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}
