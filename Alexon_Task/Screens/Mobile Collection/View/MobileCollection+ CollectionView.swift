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
        return self.controller.Mobiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MobileCVCell
        
       cell.imageView.loadImage(controller.Mobiles[indexPath.row].thumbnail ?? "")
        cell.lblTitle.text = controller.Mobiles[indexPath.row].title
        cell.lbldescribtion.text = controller.Mobiles[indexPath.row].description
        cell.lblPrice.text = "\(controller.Mobiles[indexPath.row].price ?? 0)"
        cell.lblRating.text = "\(controller.Mobiles[indexPath.row].rating ?? 0.0)"
        
        
        
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2 ) - 20
        let hight = (collectionView.frame.height / 3 ) - 20
        return CGSize(width: width, height: hight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
