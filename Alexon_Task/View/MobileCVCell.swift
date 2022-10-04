//
//  MobileCVCell.swift
//  Alexon_Task
//
//  Created by Ahmed Ashraf on 04/10/2022.
//

import UIKit

class MobileCVCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 10
            backView.layer.shadowColor = UIColor.black.cgColor
            backView.layer.shadowOffset = CGSize(width: 3, height: 3)
            backView.layer.shadowOpacity = 0.1
            backView.layer.shadowRadius = 2.0
        }
    }
    @IBOutlet weak var imageView: UIImageView!{
        didSet{
            imageView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var viewPrice: UIView!{
        didSet{
            viewPrice.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewRating: UIView!{
        didSet{
            viewRating.layer.cornerRadius = 10
            viewRating.layer.shadowColor = UIColor(hexString: "#FE724C").cgColor
            viewRating.layer.shadowOffset = CGSize(width: 3, height: 3)
            viewRating.layer.shadowOpacity = 0.2
            viewRating.layer.shadowRadius = 4.0
        }
    }
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lbldescribtion: UILabel!
}
