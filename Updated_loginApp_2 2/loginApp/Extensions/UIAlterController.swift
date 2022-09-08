//
//  UIAlterController.swift
//  loginApp
//
//  Created by Jayasri  on 01/09/22.
//

import Foundation
import UIKit
extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidPhoneNumber(numberStr:String) -> Bool {
        let PHONE_REGEX = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: numberStr)
        return result
        
    }
    
    func isPasswordValid(passwordStr : String) -> Bool {
        let passwordTest = NSPredicate (format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$&*%^&~ ]).{8,}$")
        return passwordTest.evaluate(with: passwordStr)
    }
}
