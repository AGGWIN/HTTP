//
//  MultiPartContent.swift
//  HTTP
//
//  Created by TTSY on 2018/12/11.
//  Copyright © 2018 AGGWIN. All rights reserved.
//

import Foundation

public enum ContentType {
    case data
    case jpg
    case png
    
    var rawValue: String {
        switch self {
        case .data:
            return "application/octet-stream"
        case .jpg:
            return "image/jpeg"
        case .png:
            return "image/png"
        }
    }
}

public struct MultiPartContent {
    
    let name: String
    let fileName: String
    let type: String
    let data: Data?
    let url: URL?
    
    public init(name: String, fileName: String, type: ContentType, data: Data) {
        self.name = name
        self.fileName = fileName
        self.type = type.rawValue
        self.data = data
        self.url = nil
    }
    
    public init(name: String, type: ContentType, url: URL) {
        self.name = name
        self.fileName = url.lastPathComponent
        self.type = type.rawValue
        self.data = nil
        self.url = url
    }
    
}
