//
//  EDGLDemoViewModelTest.swift
//  EDGLDemoTests
//
//  Created by Anand Tugaon on 05/12/22.
//

import XCTest
import Combine
@testable import EDGLDemo

class EDGLDemoViewModelTest: XCTestCase {
    var viewModel: EDGLDemoViewModel!
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        viewModel = EDGLDemoViewModel(dataService: ProductListtMockDataService() )
    }

    func testEDGLDemoViewModelProductList() {
        let vm  = EDGLDemoViewModel(dataService: EDGLDataServiceRequest(url: URL(string: URLConstants.url)!))
        XCTAssertNil(vm.productLists)
    }
    
    func testfetchFeedSuccess() {
        viewModel.dataService.getData().sink { _ in
        } receiveValue: { [weak self] products in
            XCTAssertGreaterThan(products.products.count, 0)
        }.store(in: &cancellables)
    }

}
