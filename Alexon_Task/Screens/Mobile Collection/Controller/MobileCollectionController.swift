//
//  MobileCollectionController.swift
//  Alexon_Task
//
//  Created by Ahmed Ashraf on 04/10/2022.
//

import Foundation
import Alamofire

class MobileCollectionController {
    
    var Mobiles = [mobileModel]()
    
    func getMobileList(success:(()->())?, error:((String)->())?){
        let url = "https://dummyjson.com/products"
        
        AF.request(url).response { response in
            switch response.result {
                
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                    //let total = json?["total"] as? Int
                    let prodact = json?["products"] as? [[String:Any]]
                    
                    for item in prodact! as [[String:Any]] {
                        let mobileModel = mobileModel(mobileAPI: item)
                        self.Mobiles.append(mobileModel)  
                    }
                    success?()

                }catch{

                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
