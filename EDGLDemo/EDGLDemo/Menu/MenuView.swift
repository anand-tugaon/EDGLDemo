//
//  MenuView.swift
//  EDGDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var  edglDemoViewModel: EDGLDemoViewModel

    init(dataService: EDGLDataServiceRequestProtocol) {
        _edglDemoViewModel = StateObject(wrappedValue: EDGLDemoViewModel(dataService: dataService))
        
    }
    var body: some View {
        
        TabView {
            ProductView(viewModel: edglDemoViewModel)
                .tabItem {
                    Label("Products", systemImage: "list.dash")
                }
            FavouriteView(viewModel: edglDemoViewModel )
                .tabItem{
                    Label("Favourite", systemImage: "heart.text.square")
                }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductListtMockDataService()
        MenuView(dataService: viewModel)
    }
}
