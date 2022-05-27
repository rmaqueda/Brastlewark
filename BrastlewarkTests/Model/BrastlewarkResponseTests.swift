//
//  gnomesResponseTests.swift
//  gnomesTests
//
//  Created by Maqueda, Ricardo Javier on 24/5/22.
//

import XCTest
@testable import Brastlewark

class gnomesResponseTests: XCTestCase {

    func test_parse_response() throws {
        let response = Bundle.brastlewarkResponse
        
        XCTAssertEqual(response.gnomes.count, 10)
        XCTAssertEqual(response.gnomes[0].id, 0)
        XCTAssertEqual(response.gnomes[0].name, "Tobus Quickwhistle")
        XCTAssertEqual(response.gnomes[0].thumbnail, "http://www.publicdomainpictures.net/pictures/10000/nahled/thinking-monkey-11282237747K8xB.jpg")
        XCTAssertEqual(response.gnomes[0].age, 306)
        XCTAssertEqual(response.gnomes[0].weight, 39.065952)
        XCTAssertEqual(response.gnomes[0].height, 107.75835)
        XCTAssertEqual(response.gnomes[0].hairColor, .pink)
        XCTAssertEqual(response.gnomes[0].professions.count, 24)
        XCTAssertEqual(response.gnomes[0].friends.count, 2)
    }

}
