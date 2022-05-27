//
//  HTTPStubProtocol.swift
//  WeatherAppTests
//
//  Created by Ricardo Maqueda Martinez on 05/02/2021.
//
// https://developer.apple.com/documentation/foundation/urlprotocol
// https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way

import Foundation

class HTTPStubProtocol: URLProtocol {
    private struct Stub {
        let data: Data
        let response: HTTPURLResponse
    }
    
    private static var stubs: [URLRequest: Stub] = [:]
    
    static func stub<Output>(
        output: Output,
        for request: URLRequest
    ) where Output: Encodable {
        stub(try! JSONEncoder().encode(output), for: request)
    }
    
    static func stub(_ data: Data, for request: URLRequest) {
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        stubs[request] = Stub(data: data, response: response)
    }
    
    // MARK: URLProtocol

    public static func removeAllStubs() {
        stubs.removeAll()
    }

    override open class func canInit(with request: URLRequest) -> Bool {
        if stubs.keys.contains(request) {
            return true
        } else {
            // Here Could be possible crash on system networks request during the tests, with:
            // fatalError("Stub missing the request'll go to system call.")
            return false
        }
    }

    override open class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override open class func requestIsCacheEquivalent(_: URLRequest, to _: URLRequest) -> Bool {
        false
    }

    override open func startLoading() {
        guard let stub = HTTPStubProtocol.stubs[request] else {
            fatalError("Couldn't find stub for request \(request)")
        }

        client!.urlProtocol(self, didReceive: stub.response, cacheStoragePolicy: .notAllowed)
        client!.urlProtocol(self, didLoad: stub.data)
        client!.urlProtocolDidFinishLoading(self)
    }

    override open func stopLoading() {
        // Empty Required by the superclass.
    }
}
