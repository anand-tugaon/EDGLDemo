//
//  ContentView.swift
//  EDGDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import SwiftUI

struct ProductView: View {
    @StateObject var  edglDemoViewModel: EDGLDemoViewModel

    init(viewModel: EDGLDemoViewModel) {
        _edglDemoViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                if let products = edglDemoViewModel.productLists?.products {
                    ForEach(products) { product in
                        NavigationLink {
                           ProductDetailView(viewModel: edglDemoViewModel, product: product)
                        } label: {
                            ProductRowView(viewModel: edglDemoViewModel, product: product)
                        }
                    }
                }
            }.navigationTitle("Products")
                .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView(viewModel: EDGDemoViewModel())
//    }
//}
