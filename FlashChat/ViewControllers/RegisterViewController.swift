//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Келлер Дмитрий on 04.06.2023.
//

import UIKit
import Firebase

final class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { [unowned self] authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: "Invalid format", message: e.localizedDescription, preferredStyle: .alert)
                    
                    let OkAction = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
                        self.passwordTextfield.text = ""
                    }
                        alert.addAction(OkAction)
                        present(alert, animated: true)
                        return
                    } else {
                        //Navigate to the ChatVController
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                }
            }
        }
    }
