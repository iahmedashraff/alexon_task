//
//  UIImage.swift
//  Alexon_Task
//
//  Created by Ahmed Ashraf on 04/10/2022.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView{
    func loadImage(_ urlss : String) {
        
        let url = URL(string: urlss)
        
        self.kf.indicatorType = .activity
        
        
        
        self.kf.setImage(with: url)
        
        
    }
}
