//
//  GnomeListViewModelTests.swift
//  BrastlewarkTests
//
//  Created by Maqueda, Ricardo Javier on 27/5/22.
//

import XCTest
import Combine
@testable import Brastlewark

class GnomeListViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    func test_init_make_network_request() {
        // given
        let session = URLSession.stubResponse
        let exp = expectation(description: "Waiting for response")

        // when
        let sut = GnomeListViewModel(session: session)

        // then
        sut.$result
            .dropFirst()
            .sink { gnomes in
                XCTAssertEqual(gnomes.count, 10)
                exp.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [exp], timeout: 1)
    }

}
