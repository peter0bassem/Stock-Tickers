//
//  URLExtensions.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//

import Foundation

extension URL {
    func toQueryItems() -> [URLQueryItem]? { return URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems }
}

extension URL {
    
    static func checkPath(_ path: String) -> Bool {
        let isFileExist = FileManager.default.fileExists(atPath: path)
        return isFileExist
    }
    
    static func documentsPath(forFileName fileName: String) -> URL? {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let writePath = URL(string: documents)!.appendingPathComponent(fileName)
        
        var directory: ObjCBool = ObjCBool(false)
        if FileManager.default.fileExists(atPath: documents, isDirectory:&directory) {
            return directory.boolValue ? writePath : nil
        }
        return nil
    }
}
