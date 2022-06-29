//
//  BaseService.swift
//  TOD
//
//  Created by Peter Bassem on 26/10/2021.
//

import Foundation

protocol BaseService {
    associatedtype CodableResponse: Codable
//    func getFromRemote(from apiRouter: APIRouter, completion: @escaping (Result<CodableResponse, NetworkErrorType>) -> Void)
}
