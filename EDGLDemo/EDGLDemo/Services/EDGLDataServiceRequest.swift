//
//  EDGLDataServiceRequest.swift
//  EDGLDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import Foundation
import Combine

protocol EDGLDataServiceRequestProtocol {
    func getData() -> AnyPublisher<Products, Error>
}

class EDGLDataServiceRequest: EDGLDataServiceRequestProtocol {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<Products, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map( { $0.data})
            .decode(type: Products.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
