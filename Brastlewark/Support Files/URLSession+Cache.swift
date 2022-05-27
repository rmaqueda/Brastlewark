//
//  URLSession+Cache.swift
//  Brastlewark
//
//  Created by Maqueda, Ricardo Javier on 24/5/22.
//

import Foundation

extension URLSession {

    static var bigCache: URLSession = {
        let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let diskCacheURL = cachesURL.appendingPathComponent("DownloadCache")
        let cache = URLCache(memoryCapacity: 10_000_000, diskCapacity: 1_000_000_000, directory: diskCacheURL)

        let config = URLSessionConfiguration.default
        config.urlCache = cache

        return URLSession(configuration: config)
    }()

}
