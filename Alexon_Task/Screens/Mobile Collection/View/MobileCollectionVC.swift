//
//  MobileCollectionVC.swift
//  Alexon_Task
//
//  Created by Ahmed Ashraf on 04/10/2022.
//

import UIKit

class MobileCollectionVC: UIViewController {
    // MARK: - Constanse
    var controller: MobileCollectionController = MobileCollectionController()
    
    // MARK: - Outlets
    @IBOutlet weak var btnBack: UIButton!{
        didSet{
            btnBack.layer.cornerRadius = 30
            btnBack.layer.shadowColor = UIColor.black.cgColor
            btnBack.layer.shadowOffset = CGSize(width: 3, height: 3)
            btnBack.layer.shadowOpacity = 0.2
            btnBack.layer.shadowRadius = 4.0
        }
    }
    
    @IBOutlet weak var imgPhoto: UIImageView!{
        didSet{
            imgPhoto.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var viewSearch: UIView!{
        didSet{
            viewSearch.layer.borderWidth = 3
            viewSearch.layer.borderColor = UIColor(hexString: "#F9F9F9").cgColor
            viewSearch.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var viewOwnBtns: UIView!{
        didSet{
            viewOwnBtns.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var btnMobile: UIButton!{
        didSet{
            btnMobile.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var btnStores: UIButton!{
        didSet{
            btnStores.layer.cornerRadius = 20
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        controller.getMobileList { response in
            print("تم بنجاح")
            
        } failure: { error in
            print("error")
        } finish: {
            print("Done")
        }

    }
    

    // MARK: - IBACtions
    
    
    // MARK: - Helper Functions



}
