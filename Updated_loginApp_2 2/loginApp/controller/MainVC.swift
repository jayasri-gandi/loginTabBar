//
//  ViewController.swift
//  loginApp
//
//  Created by Jayasri  on 01/09/22.
//

//import UIKit
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit
import FBSDKLoginKit
import UIKit
class MainVC: UIViewController,LoginButtonDelegate {
    @IBOutlet var faceBookView:UIView!
    let loginButton = FBLoginButton()

       override func viewDidLoad() {
        super.viewDidLoad()
           if let token = AccessToken.current,
                   !token.isExpired {
               let token = token.tokenString
               
               let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["feilds": "email,name"], tokenString: token, version: nil, httpMethod: .get)
               request.start(completionHandler: { connection , result , error in print("\(result)")
                       })
               }
           else{
                       loginButton.center = faceBookView.center
               loginButton.delegate = self
               loginButton.isHidden = true
//               loginButton.permissions = ["public_profile", "email"]
                       faceBookView.addSubview(loginButton)
           }
           }
func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
    
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    }
    
    @IBAction func onTapfacebookBtn(_ sender: Any) {
//        let fbLoginManager : LoginManager = LoginManager()
//        fbLoginManager.logIn([.publicProfile, .email ], viewController: self) { (result) in
//                switch result{
//                case .cancelled:
//                    print("Cancel button click")
//                case .success:
//                    let params = ["fields" : "id, name, first_name, last_name, picture.type(large), email "]
//                    let graphRequest = FBSDKGraphRequest.init(graphPath: "/me", parameters: params)
//                    let Connection = FBSDKGraphRequestConnection()
//                    Connection.add(graphRequest) { (Connection, result, error) in
//                        let info = result as! [String : AnyObject]
//                        print(info["name"] as! String)
//                    }
//                    Connection.start()
//                default:
//                    print("??")
//                }
//            }
        print("Facebook Taped")
        }
//        self.loginButton.sendActionsForControlEvents: UIControlEventTouchUpInside
        
    
    @IBAction func onTapGoogleBtn(_ sender: Any) {
        let signInConfig = GIDConfiguration(clientID: "516444324421-fg7oa3eo7js343sohigrf6tstk4jk7dp.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            print("Google Taped")
        }
    }
    @IBAction func signUpBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Signup") as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as! loginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

