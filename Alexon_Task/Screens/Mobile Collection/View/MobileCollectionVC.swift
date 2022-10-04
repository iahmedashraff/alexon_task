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
            btnBack.layer.cornerRadius = btnBack.layer.frame.height / 2
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
    
    @IBOutlet weak var btnFilter: UIButton!{
        didSet{
            btnFilter.layer.cornerRadius = 10
            btnFilter.layer.shadowColor = UIColor.black.cgColor
            btnFilter.layer.shadowOffset = CGSize(width: 3, height: 3)
            btnFilter.layer.shadowOpacity = 0.2
            btnFilter.layer.shadowRadius = 4.0
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
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        getMobiles()
        
        if let layout = collectionView?.collectionViewLayout as? collectionLayout {
          layout.delegate = self
        }
        

    }
    

    // MARK: - IBACtions
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    // MARK: - Helper Functions

    func getMobiles(){
        controller.getMobileList {
            self.collectionView.reloadData()
        } error: { err in
            print(err)
        }

    }

}
extension MobileCollectionVC: collectionLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 70
        }
        
        let hight = (collectionView.frame.height / 3 ) - 20
    return hight + (indexPath.row % 2 == 0 ? 30 : 90)
  }
    
}

