//
//  Product.swift
//  EDGDemo
//
//  Created by Anand Tugaon on 05/11/22.
//

import Foundation

struct Product: Decodable, Identifiable {
    var citrusId: String?
    var title: String?
    var id: String?
    var brand: String?
    var imageURL: String?
    var price: [Price]?
    var ratingCount: Double
    var isAddToCartEnable: Bool?
    var addToCartButtonText: String?
    var isInTrolley: Bool?
    var isInWishlist: Bool?
    var isFindMeEnable: Bool?
    var saleUnitPrice: Double?
    var totalReviewCount: Int?
    var isDeliveryOnly: Bool?
    var isDirectFromSupplier: Bool?
    var isFavourite: Bool? = false
}

struct Price: Decodable, Identifiable {
    var message: String?
    var value: Double?
    var isOfferPrice: Bool?
    var id: UUID? = UUID()
}

