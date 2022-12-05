//
//  ProductRowView.swift
//  EDGDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import SwiftUI

struct ProductRowView: View {
    
    @StateObject var  edglDemoViewModel: EDGLDemoViewModel
    var product: Product
    
    init(viewModel: EDGLDemoViewModel, product: Product) {
        _edglDemoViewModel = StateObject(wrappedValue: viewModel)
        self.product = product
    }
    
    var body: some View {
        HStack {
            ZStack(alignment: .topTrailing) {
                thumbNilImage(urlString: product.imageURL ?? "")
                Button {
                    edglDemoViewModel.chooseFavourite(product)
                } label: {
                    if !(product.isFavourite ?? false) {
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundColor(Color.black)
                            .scaledToFit()
                            .frame(width:30 , height: 30)
                        
                    } else {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(Color.black)
                            .scaledToFit()
                            .frame(width:30 , height: 30)
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }
            
            VStack {
                Text(product.title ?? "")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                Spacer()
                VStack {
                    HStack {
                        if let productPriceArray = product.price {
                            ForEach(productPriceArray) { price in
                                let priceStr = String(format: "%.2f", (price.value ?? 0.00))
                                Text("$ \(priceStr)").bold().font(.system(size: 12))
                            }
                        }
                        Spacer()
                        Button {
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
            }
        }
    }
}



struct thumbNilImage: View {
    @StateObject var   imageDownloaderRequest = ImageDownloaderRequest()
    let urlString: String
    
    var body: some View {
        if let uiimage = imageDownloaderRequest.displayImage {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.gray)
            
        } else {
            Image(systemName: "video")                  //Use as default Image 
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    imageDownloaderRequest.getImage(imageUrl: urlString)
                }
        }
    }
}

//struct ProductRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductRowView(product: Product())
//    }
//}
