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
        if edglDemoViewModel.errorString != nil {
            Text("\(edglDemoViewModel.errorString ?? AppConstants.internalServerError)")
                .bold()
                .lineLimit(2)
                .padding(.horizontal, 24)
                .multilineTextAlignment(.center)
        } else {
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
                }.navigationTitle(AppConstants.productsTitle)
                    .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(viewModel: EDGLDemoViewModel(dataService: ProductListtMockDataService()))
    }
}
