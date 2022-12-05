//
//  FavouriteView.swift
//  EDGDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import SwiftUI


struct FavouriteView: View {
    
    @StateObject var  edglDemoViewModel: EDGLDemoViewModel
    
    init(viewModel: EDGLDemoViewModel) {
        _edglDemoViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                if let products = edglDemoViewModel.productLists?.products {
                    ForEach(products) { product in
                        if product.isFavourite ?? false {
                            NavigationLink {
                                ProductDetailView(viewModel: edglDemoViewModel, product: product)
                            } label: {
                                ProductRowView(viewModel: edglDemoViewModel, product: product)
                            }
                        }
                    }
                }
            }.navigationTitle(AppConstants.myFavouriteTitle)
                .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView(viewModel: EDGLDemoViewModel(dataService: ProductListtMockDataService()))
    }
}
