//
//  textFeildNib.swift
//  Recipes App-PoMac Task
//
//  Created by Ahmed Ashraf on 14/03/2022.
//

import Foundation
import UIKit


@IBDesignable
class textFeildNib: UIView, UITextFieldDelegate{
    
    //MARK: -Constanse
    var placeHolder: String? {
        didSet {
//            self.lblPlaceHolder.text = placeHolder
            self.textField.placeholder = placeHolder
        }
    }
    var text: String? {
        didSet {
            self.textField.text = text
        }
    }
    var keyboardType: UIKeyboardType? {
       didSet {
           self.textField.keyboardType = keyboardType ?? .default

           
       }
   }
    var isSecure: Bool? {
       didSet {
           self.textField.isSecureTextEntry = isSecure ?? false
       }
   }
    var isTextHidden: Bool?{
        didSet{
            self.textField.isHidden = true
        }
    }
  
    
   
    //MARK: -Outlets
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lblPlaceHolder: UILabel!{
        didSet{
            self.lblPlaceHolder.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self

        
    }
    override init(frame: CGRect) {
            super.init(frame: frame)
            commit()
        }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commit()
        }
    
    //MARK: -IBACtions

    @IBAction func changedTextFiledValueForText(_ sender: Any) {
        text = textField.text
    }
    
    //MARK: -Helper Function


                // For Making Animation to placeholder


    func commit(){
          Bundle.main.loadNibNamed("textFeildNib", owner: self, options: nil)
          addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask  = [.flexibleHeight,.flexibleWidth]
       
      }
}
