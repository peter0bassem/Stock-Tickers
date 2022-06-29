//
//  NetworkConstants.swift
//  Attendance
//
//  Created by Peter Bassem on 12/16/19.
//  Copyright © 2019 iMac. All rights reserved.
//
import Foundation

struct KNetworkConstants {
    struct ProductionServer {
        static let baseURL = "https://saurav.tech/"
    }
    
    enum HTTPHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case acceptLanguage = "Accept-Language"
    }
    
    enum ContentType: String {
        case json = "application/json"
        case formData = "form-data"
        case multipart = "multipart/form-data"
        case bearer = "Bearer"
    }
    
    enum EndPoint: String {
        case stocks = "https://raw.githubusercontent.com/dsancov/TestData/main/stocks.csv"
    }
}
