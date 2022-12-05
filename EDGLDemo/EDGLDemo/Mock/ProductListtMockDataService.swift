//
//  ProductListtMockDataService.swift
//  EDGLDemoTests
//
//  Created by Anand Tugaon on 05/12/22.
//

import Foundation
import Combine
@testable import EDGLDemo

class ProductListtMockDataService: EDGLDataServiceRequestProtocol  {
   
    func getData() -> AnyPublisher<Products, Error> {
        
        let jsonString = """
               "products":[
             {
                "citrusId":"display_1_F_Al-mgtjXrg-pn33UYREA0P0KCgoIRE1fMjMxMjQSABoMCP2us5YGEJrokdEDIgIIAQ==",
                "title":"Diamond Label Shiraz",
                "id":"23124",
                "imageURL":"https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM",
                "price":[
                   {
                      "message":"in any six",
                      "value":9.40,
                      "isOfferPrice":false
                   }
                ],
                "brand":"Rosemount",
                "badges":[
                   "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"
                ],
                "ratingCount":4.0,
                "messages":{
                   "secondaryMessage":"Sponsored",
                   "sash":{
                      
                   }
                },
                "isAddToCartEnable":true,
                "addToCartButtonText":"Add to cart",
                "isInTrolley":false,
                "isInWishlist":false,
                "purchaseTypes":[
                   {
                      "purchaseType":"Bottle",
                      "displayName":"per bottle",
                      "unitPrice":10.18,
                      "minQtyLimit":1,
                      "maxQtyLimit":60,
                      "cartQty":0
                   },
                   {
                      "purchaseType":"Case",
                      "displayName":"per case of 6",
                      "unitPrice":56.85,
                      "minQtyLimit":1,
                      "maxQtyLimit":10,
                      "cartQty":0
                   }
                ],
                "isFindMeEnable":false,
                "saleUnitPrice":10.18,
                "totalReviewCount":11,
                "isDeliveryOnly":false,
                "isDirectFromSupplier":false
             }
       ]
       }
       """
        let data = jsonString.data(using: .utf8)
        
        return Just(data!).map( { $0  }).decode(type: Products.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
