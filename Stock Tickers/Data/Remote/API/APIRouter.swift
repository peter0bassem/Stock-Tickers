//
//  APIRouter.swift
//  TOD
//
//  Created by Peter Bassem on 26/10/2021.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    case login
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login: return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .login: return "api/Authentication/Login"
        }
    }
    
    // MARK: - Quary
    var query: [URLQueryItem]? {
        switch self {
        case .login: return nil
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .login: return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var url = try KNetworkConstants.ProductionServer.baseURL.asURL()
        
        if let query = query {
            var urlComponents = URLComponents(string: url.absoluteString)
            urlComponents?.queryItems = query
            url = try (urlComponents?.asURL())!
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
//        print(urlRequest)
        
        // Common Headers
        HeaderInterceptor.defaultHeaderInterceptor(fromURLRequest: &urlRequest)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
