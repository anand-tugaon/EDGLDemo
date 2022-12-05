//
//  EDGLDemoApp.swift
//  EDGLDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import SwiftUI

@main
struct EDGLDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let dataService = EDGLDataServiceRequest(url: URL(string: URLConstants.url)!) 
            MenuView(dataService: dataService)
        }
    }
}
