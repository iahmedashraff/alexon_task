//
//  MobileCollection+ CollectionView.swift
//  Alexon_Task
//
//  Created by Ahmed Ashraf on 04/10/2022.
//

import Foundation
import UIKit


extension MobileCollectionVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.controller.Mobiles.count > 0 {
                    return self.controller.Mobiles.count  + 1
                }
                return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCVCell", for: indexPath) as! SearchCVCell
            cell.lblSearch.text = "Found \(self.controller.Mobiles.count) results"
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MobileCVCell
        
       cell.imageView.loadImage(controller.Mobiles[indexPath.row - 1].thumbnail ?? "")
        cell.lblTitle.text = controller.Mobiles[indexPath.row - 1].title
        cell.lbldescribtion.text = controller.Mobiles[indexPath.row - 1].description
        cell.lblPrice.text = "\(controller.Mobiles[indexPath.row - 1].price ?? 0)"
        cell.lblRating.text = "\(controller.Mobiles[indexPath.row - 1].rating ?? 0.0)"
        return cell
 
    }
    

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (collectionView.frame.width / 2 ) - 20
//        let hight = (collectionView.frame.height / 3 ) - 20
//        return CGSize(width: width, height: hight)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
      }
}
