//
//  LoginVC.swift
//  loginApp
//
//  Created by Jayasri  on 01/09/22.
//

import UIKit
class loginVC: UIViewController {
    @IBOutlet weak var emailTxtFeild: UITextField!
    @IBOutlet weak var passwordTxtFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
    @IBAction func loginButton(_ sender: Any) {
        
        guard let strEmail = self.emailTxtFeild?.text, !(strEmail.isEmpty) else {
            showAlert(title: "Email Required", message: "Please enter email")
            return
        }
        guard (self.isValidEmail(testStr: strEmail)) else {
            showAlert(title: "Invalid Eamil", message: "please enter valid email")
            return
        }
        guard let strPassword = self.passwordTxtFeild?.text, !(strPassword.isEmpty) else {
            showAlert(title: "Password Required", message: "Please enter password")
            return
        }
        guard (self.isPasswordValid(passwordStr: strPassword)) else {
            showAlert(title: "Invalid Password", message: "Please enter valid password")
            return
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabBarVC") as! mainTabBarVC
        
        UserDefaults.standard.set(emailTxtFeild.text!, forKey: "email")
        UserDefaults.standard.set(passwordTxtFeild.text!, forKey: "password")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func newUserTapped(_ sender:UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Signup") as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


