//
//  EDGLDemoViewModel.swift
//  EDGLDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import Foundation
import Combine
import UIKit

class EDGLDemoViewModel: ObservableObject {
    @Published var productLists: Products?
  
    var cancellables = Set<AnyCancellable>()
    var dataService: EDGLDataServiceRequestProtocol
    
    init(dataService: EDGLDataServiceRequestProtocol) {
        self.dataService = dataService
        getProducts()
    }
    
    private func getProducts() {
        dataService.getData().sink { _ in
            
        } receiveValue: { [weak self] returnPosts in
            self?.productLists = returnPosts
        }.store(in: &cancellables)
    }
    
    func chooseFavourite(_ product: Product) {
        let chooseIndex = index(of: product)
        if productLists?.products[chooseIndex].isFavourite == nil {
            productLists?.products[chooseIndex].isFavourite = true
        } else {
            productLists?.products[chooseIndex].isFavourite?.toggle()
        }
    }
    
   private func index(of product: Product) -> Int {
        if let productLists = productLists {
            for index in 0..<productLists.products.count {
                if (product.id == productLists.products[index].id) {
                    return index
                }
            }
        }
        return 0
    }
    
}
