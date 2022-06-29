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
        static let baseURL = "https://gw.s-badge.com/axa-api-dev/" //"http://gw.s-badge.com/axa"
    }
    
    enum APIQueryKey: String {
        case card, password, country, gender
        case arabicName = "Name_ar"
        case englishName = "Name_en"
        case phone = "Mobile"
        case email = "Mail"
        case id = "Card"
        case registerPassword = "Pass"
        
    }
    
    enum APIParameterKey: String {
        case userProfileImage = "PictureFile"
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
        case uploadWorkOrderDocument = "api/WorkOrders/upload_document"
        case closeWorkOrder = "api/WorkOrders/close_technicianWorkOrder"
    }
}
