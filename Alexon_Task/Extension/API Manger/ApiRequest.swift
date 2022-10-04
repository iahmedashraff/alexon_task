//
//  LoginRequest.swift
//  mashrue
//
//  Created by Ahmed Ashraf on 23/08/2022.
//

import Foundation

struct apiRequest: Encodable{
    let total: Int?
    let title: String?
    let description: String?
    let price: Int?
    let rating: Double?
    let thumbnail: String?

    }

struct apiResponse {
        var mobile: mobileModel?
        
    }


