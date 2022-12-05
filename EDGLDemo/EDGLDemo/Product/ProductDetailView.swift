//
//  ProductDetailView.swift
//  EDGDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var  edglDemoViewModel: EDGLDemoViewModel
    var product: Product
    

    init(viewModel: EDGLDemoViewModel, product: Product) {
        _edglDemoViewModel = StateObject(wrappedValue: viewModel)
        self.product = product
    }
    
    var body: some View {
        
        ZStack() {
            VStack {
                ZStack(alignment: .topTrailing) {
                    MainImage(urlString: product.imageURL ?? "").padding(.bottom)
                    Button {
                        edglDemoViewModel.chooseFavourite(product)
                    } label: {
                        if !(product.isFavourite ?? false) {
                            Image(systemName: "heart")
                                .resizable()
                                .foregroundColor(Color.black)
                                .scaledToFit()
                                .frame(width:60 , height: 60)
                                
                        } else {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(Color.black)
                                .scaledToFit()
                                .frame(width:60 , height: 60)
                        }
                    }.padding(.trailing,16)
                }
                
                VStack {
                    Text(product.title ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    HStack {
                        if let productPriceArray = product.price {
                            ForEach(productPriceArray) { price in
                                let priceStr = String(format: "%.2f", (price.value ?? 0.00))
                                Text("$ \(priceStr)").bold().font(.system(size: 20)).padding()
                            }
                        }
                        Spacer()
                        ForEach(0..<5 ) { _ in
                            Image(systemName: "star")
                                .scaledToFit()
                                .frame(height: 30)
                        }
                    }
                }
            }
        }
    }
}

struct MainImage: View {
    @StateObject var   imageDownloaderRequest = ImageDownloaderRequest()
    let urlString: String
    
    var body: some View {
        if let uiimage = imageDownloaderRequest.displayImage {
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFit()
        } else {
            Image(systemName: "video")
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .background(Color.gray)
                .onAppear {
                    imageDownloaderRequest.getImage(imageUrl: urlString)
                }
        }
    }
}
