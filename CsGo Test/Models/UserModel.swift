//
//  UserModel.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation

struct UserModel: Decodable {
    let id: Int
    let images: [String]
    let name: String
    let categoryName: String
    let tags: [String]
    let price: Int
    let oldPrice: Int?
    let discountText: String?
    var quantity: Int
    var available: Int
    let descriptionHtml: String
    
    typealias State = (productId: Int, quantity: Int, available: Int)
}
