//
//  MobileModel.swift
//  Alexon_Task
//
//  Created by Ahmed Ashraf on 04/10/2022.
//

import Foundation

class mobileModel {
    var total: Int?
    var title: String?
    var description: String?
    var price: Int?
    var rating: Double?
    var thumbnail: String?
    
    init(){}
    
    
    init(mobileAPI: [String:Any]?){
        self.total = mobileAPI?["total"] as? Int
        self.title = mobileAPI?["title"] as? String
        self.description = mobileAPI?["description"] as? String
        self.price = mobileAPI?["price"] as? Int
        self.rating = mobileAPI?["rating"] as? Double
        self.thumbnail = mobileAPI?["thumbnail"] as? String
    }
    
    
}
