//
//  APIClient.swift
//  Attendance
//
//  Created by Peter Bassem on 12/16/19.
//  Copyright © 2019 iMac. All rights reserved.
//

import Foundation
import Alamofire
import PromisedFuture

enum NetworkErrorType: String, Error {
    case noInternet = "error.no_internet"
    case serverError = "error.error_in_server"
    case couldNotParseJson = "error.decoding_error"
    case empty = "error.empty"
    case authenicationRequired = "error.authentication_required"
    case unknownError = "error.unknown_error"
}

class APIClient {
    
    // MARK: - peroformRequest with Future
    @discardableResult
    static func performRequest<T: Decodable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder()) -> Future<T, NetworkErrorType> {
        guard NetworkManager.isConnectedToInternet else {
            let future = Future<T, NetworkErrorType> { completion in
                completion(.failure(NetworkErrorType.noInternet))
            }
            return future
        }
        return Future(operation: { (completion) in
            AF.request(route)
                .validate(statusCode: 200...300)
                .responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
//                    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
//                    print(response.response?.statusCode ?? -1)
//                    print(response.result)
//                    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(_):
                        if let data = response.data {
                            do {
                                let value = try JSONDecoder().decode(T.self, from: data)
                                completion(.success(value))
                            } catch {
                                completion(.failure(NetworkErrorType.couldNotParseJson))
                            }

                        } else {
                            completion(.failure(NetworkErrorType.serverError))
                        }
                    }
                })
        })
    }
}
