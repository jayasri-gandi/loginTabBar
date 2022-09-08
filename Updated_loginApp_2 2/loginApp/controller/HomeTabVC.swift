//
//  HomeTabVC.swift
//  loginApp
//
//  Created by Jayasri  on 07/09/22.
//

import UIKit

class HomeTabVC: UIViewController {
    var userName:String!
    var userPassword:String!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let emailStr = UserDefaults.standard.value(forKey: "email") as? String{
            emailLbl.text = emailStr
                }
        if let passwordStr = UserDefaults.standard.value(forKey: "password") as? String{
            passLbl.text = passwordStr
                }

    }
}
