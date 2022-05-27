//
//  URLSession.swift
//  BrastlewarkIntegrationTests
//
//  Created by Maqueda, Ricardo Javier on 27/5/22.
//

import Foundation

extension URLSession {

    static var stubResponse: URLSession {
        let sessionStub = URLSession.stubbed
        let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json")!
        let request = URLRequest(url: url)
        let response = Bundle.brastlewarkResponse
        HTTPStubProtocol.stub(output: response, for: request)

        return sessionStub
    }

    static var stubbed: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [HTTPStubProtocol.self]
        URLProtocol.registerClass(HTTPStubProtocol.self)

        return URLSession(configuration: configuration)
    }

}
