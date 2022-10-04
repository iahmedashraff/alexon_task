//
//  RegisterVC.swift
//  Alexon_Task
//
//  Created by Ahmed Ashraf on 03/10/2022.
//

import UIKit

class RegisterVC: UIViewController, UITextFieldDelegate {
    // MARK: - Constase
    var showPasswordClick = true
    // MARK: - Outlets
    @IBOutlet weak var lblErrorName: UILabel!
    @IBOutlet weak var viewName: UIView!

    @IBOutlet weak var viewNibName: textFeildNib!
    @IBOutlet weak var lblErrorEmail: UILabel!
    @IBOutlet weak var viewEMail: UIView!

    @IBOutlet weak var viewNibEmail: textFeildNib!
    @IBOutlet weak var lblErrorPassword: UILabel!
    @IBOutlet weak var viewPassword: UIView!

    @IBOutlet weak var viewNibPassword: textFeildNib!
    @IBOutlet weak var btnShowPassword: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var viewFacebook: UIView!
    @IBOutlet weak var viewGoogle: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
        makeTapGes()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    
    @IBAction func showPasswordBtnPressed(_ sender: UIButton) {
        if(showPasswordClick == true) {
            viewNibPassword.isSecure = false
                } else {
                    viewNibPassword.isSecure = true
                }

        showPasswordClick = !showPasswordClick
    }
    
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        if compeletfields() == true {
            guard let name = self.viewNibName.text, !name.isEmpty else {return}
            guard let email = self.viewNibEmail.text, !email.isEmpty else {return}
            guard let password = self.viewNibPassword.text, !password.isEmpty else {return}
            
            let vc = UIStoryboard(name: "Mobile", bundle: nil).instantiateViewController(withIdentifier: "MobileCollectionVC") as! MobileCollectionVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    // MARK: - HelperFunctions
    

}
// TODO: - SetupUI
extension RegisterVC {
    func SetupUI(){
   
        viewName.layer.borderWidth = 2
        viewName.layer.borderColor = UIColor(hexString: "#F1F1F1").cgColor
        viewName.layer.cornerRadius = 5
        viewNibName.placeHolder = "Enter Your Full Name"

        viewEMail.layer.borderWidth = 2
        viewEMail.layer.borderColor = UIColor(hexString: "#F1F1F1").cgColor
        viewEMail.layer.cornerRadius = 5
        viewNibEmail.placeHolder = "Enter Your Email"
        

        viewPassword.layer.borderWidth = 2
        viewPassword.layer.borderColor = UIColor(hexString: "#F1F1F1").cgColor
        viewPassword.layer.cornerRadius = 5
        viewNibPassword.placeHolder = "Enter Your Password"
        viewNibPassword.isSecure = true
        
        
        btnSignUp.layer.cornerRadius = 30
        btnSignUp.layer.shadowColor = UIColor(hexString: "#FE724C").cgColor
        btnSignUp.layer.shadowOffset = CGSize(width: 3, height: 3)
        btnSignUp.layer.shadowOpacity = 0.7
        btnSignUp.layer.shadowRadius = 4.0
        
        viewFacebook.layer.cornerRadius = 30
        viewFacebook.layer.shadowColor = UIColor.black.cgColor
        viewFacebook.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewFacebook.layer.shadowOpacity = 0.2
        viewFacebook.layer.shadowRadius = 4.0
        
        viewGoogle.layer.cornerRadius = 30
        viewGoogle.layer.shadowColor = UIColor.black.cgColor
        viewGoogle.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewGoogle.layer.shadowOpacity = 0.2
        viewGoogle.layer.shadowRadius = 4.0

}
}
// TODO: - ErrorHandling
extension RegisterVC {
        func compeletfields() -> Bool {
            var flag = true
            if (viewNibName.text?.isEmpty ?? true)  == true {
                viewNibName.lblPlaceHolder.isHidden = false
                viewNibName.lblPlaceHolder.text = "Enter you Name"
                viewNibName.lblPlaceHolder.textColor = UIColor.red
                
                flag = false
            }else {
                viewNibName.lblPlaceHolder.isHidden = true
                viewNibName.lblPlaceHolder.text = ""
            }
            if (viewNibEmail.text?.isEmpty ?? true)  == true {
                viewNibEmail.lblPlaceHolder.isHidden = false
                viewNibEmail.lblPlaceHolder.text = "Enter you Email"
                viewNibEmail.lblPlaceHolder.textColor = UIColor.red
                
                flag = false
            }else {
                viewNibEmail.lblPlaceHolder.isHidden = true
                viewNibEmail.lblPlaceHolder.text = ""
            }
            if (viewNibPassword.text?.isEmpty ?? true)  == true {
                viewNibPassword.lblPlaceHolder.isHidden = false
                viewNibPassword.lblPlaceHolder.text = "Enter Your Passsword"
                viewNibPassword.lblPlaceHolder.textColor = UIColor.red
                flag = false
            }else {
                viewNibPassword.lblPlaceHolder.isHidden = true
                viewNibPassword.lblPlaceHolder.text = ""
            }
            return flag
        }
        
}

// TODO: - Tap Gesture
extension RegisterVC{
    func makeTapGes(){
        viewName.addTapGesture { [weak self] in
            self?.view.layer.borderColor = UIColor(hexString: "#FE724C").cgColor
            self?.view.layer.borderWidth = 5
        }
        viewEMail.addTapGesture { [weak self] in
            self?.view.layer.borderColor = UIColor(hexString: "#FE724C").cgColor
            self?.view.layer.borderWidth = 5
        }
        viewPassword.addTapGesture { [weak self] in
            self?.view.layer.borderColor = UIColor(hexString: "#FE724C").cgColor
            self?.view.layer.borderWidth = 5
        }
    }
}
