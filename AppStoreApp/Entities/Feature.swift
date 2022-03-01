//
//  Feature.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/03/01.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
