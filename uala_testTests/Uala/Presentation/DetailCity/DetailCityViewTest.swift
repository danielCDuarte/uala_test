//
//  DetailCityViewTest.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 19/11/24.
//

import XCTest
import SnapshotTesting
@testable import uala_test

final class DetailCityViewTest: XCTestCase {
    
    func testDetailCityViewSnapShot() {
        let sut = DetailCityView(viewModel: DetailCityViewModelSpy(), city: TestDomainConstants.city)
        let _ = verifySnapshot(
            of: sut,
            as: .wait(for: 5, on: .image(
                precision: 0.9999,
                layout: .fixed(
                    width: UIScreen.main.bounds.size.width,
                    height: UIScreen.main.bounds.size.height)
            )),
            record: false
        )
    }
}
