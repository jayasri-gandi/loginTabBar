//
//  RegisterVC.swift
//  loginApp
//
//  Created by Jayasri  on 01/09/22.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var nameTxtFeild: UITextField!
    @IBOutlet weak var emailTxtFeild: UITextField!
    @IBOutlet weak var mobileNoTxtFeild: UITextField!
    @IBOutlet weak var passwordTxtfeild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func validationChecking() -> Bool {
        guard let strUserName = self.nameTxtFeild?.text, !(strUserName.isEmpty) else {
            showAlert(title: "User name required", message: "Please Enter Your Name")
            return false
        }
        guard let strNumber = self.mobileNoTxtFeild?.text, !(strNumber.isEmpty) else {
            showAlert(title: "Phone number rquired", message: "Please Enter Mobile Number")
            return false
        }
        guard (self.isValidPhoneNumber(numberStr: strNumber)) else {
            showAlert(title: "Invalid number", message: "Please Enter valid number")
            return false
        }
        guard let strEmail = self.emailTxtFeild?.text, !(strEmail.isEmpty) else {
            showAlert(title: "Email Required", message: "Please Enter email")
            return false
        }
        guard (self.isValidEmail(testStr: strEmail)) else {
            showAlert(title: "Invalid Eamil", message: "Please Enter valid email")
            return false
        }
        guard let strPassword = self.passwordTxtfeild?.text, !(strPassword.isEmpty) else {
            showAlert(title: "Password Required", message: "Please Enter password")
            return false
        }
        guard (self.isPasswordValid(passwordStr: strPassword)) else {
            showAlert(title: "Invalid Password", message: "Please Enter valid password")
            return false
        }
        return true
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if validationChecking() {
            let _ = ["name": nameTxtFeild.text, "mobile": mobileNoTxtFeild.text, "email": emailTxtFeild.text, "password": passwordTxtfeild.text]
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as? loginVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}



