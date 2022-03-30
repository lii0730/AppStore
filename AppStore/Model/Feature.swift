//
//  Feature.swift
//  AppStore
//
//  Created by LeeHsss on 2022/02/20.
//

import Foundation


struct Feature:Decodable {
    var type: String
    var appName: String
    var imageURL: String
    var description: String
}
