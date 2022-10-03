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
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblErrorEmail: UILabel!
    @IBOutlet weak var viewEMail: UIView!
    @IBOutlet weak var tfEMail: UITextField!
    @IBOutlet weak var lblErrorPassword: UILabel!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var tfPassword: UITextField!
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
            tfPassword.isSecureTextEntry = false
                } else {
                    tfPassword.isSecureTextEntry = true
                }

        showPasswordClick = !showPasswordClick
    }
    
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        if compeletfields() == true {
            guard let name = self.tfName.text, !name.isEmpty else {return}
            guard let email = self.tfEMail.text, !email.isEmpty else {return}
            guard let password = self.tfPassword.text, !password.isEmpty else {return}
            
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

        viewEMail.layer.borderWidth = 2
        viewEMail.layer.borderColor = UIColor(hexString: "#F1F1F1").cgColor
        viewEMail.layer.cornerRadius = 5
        

        viewPassword.layer.borderWidth = 2
        viewPassword.layer.borderColor = UIColor(hexString: "#F1F1F1").cgColor
        viewPassword.layer.cornerRadius = 5
        
        
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
        if (tfName.text?.isEmpty ?? true) || (tfEMail.text?.isEmpty ?? true) || (tfPassword.text?.isEmpty ?? true) == true {
            lblErrorName.isHidden = false
            lblErrorName.text = NSLocalizedString("Please Enter Your Name", comment: "")
            lblErrorName.textColor = UIColor.red
            lblErrorEmail.isHidden = false
            lblErrorEmail.text = NSLocalizedString("Please Enter Your Email", comment: "")
            lblErrorEmail.textColor = UIColor.red
            lblErrorPassword.isHidden = false
            lblErrorPassword.text = NSLocalizedString("Please Enter Your Password", comment: "")
            lblErrorPassword.textColor = UIColor.red
            flag = false
        }else{
            lblErrorName.isHidden = true
            lblErrorName.text = ""
            lblErrorEmail.isHidden = true
            lblErrorEmail.text = ""
            lblErrorPassword.isHidden = true
            lblErrorPassword.text = ""
        }
        if (tfName.text?.isEmpty ?? true)  == true {
            lblErrorName.isHidden = false
            lblErrorName.text = NSLocalizedString("Please Enter Your Name", comment: "")
            lblErrorName.textColor = UIColor.red
            
            flag = false
        }else {
            lblErrorName.isHidden = true
            lblErrorName.text = ""
        }
        if (tfEMail.text?.isEmpty ?? true)  == true {
            lblErrorEmail.isHidden = false
            lblErrorEmail.text = NSLocalizedString("Please Enter Your Email", comment: "")
            lblErrorEmail.textColor = UIColor.red
            
            flag = false
        }else {
            lblErrorEmail.isHidden = true
            lblErrorEmail.text = ""
        }
        if (tfPassword.text?.isEmpty ?? true)  == true {
            lblErrorPassword.isHidden = false
            lblErrorPassword.text = NSLocalizedString("Please Enter Your Password", comment: "")
            lblErrorPassword.textColor = UIColor.red
            flag = false
        }else {
            lblErrorPassword.isHidden = true
            lblErrorPassword.text = ""
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
