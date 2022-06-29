//
//  ArrayExtensions.swift
//  Driver
//
//  Created by Peter Bassem on 27/12/2020.
//  Copyright © 2020 Eslam Maged. All rights reserved.
//

import Foundation

extension Array {

    var middle: Element? {
        guard count != 0 else { return nil }

        let middleIndex = (count > 1 ? count - 1 : count) / 2
        return self[middleIndex]
    }
    
    mutating func rotate(positions: Int, size: Int? = nil) {
            let size = size ?? count
            guard positions < count && size <= count else { return }

            self[0..<positions].reverse()
            self[positions..<size].reverse()
            self[0..<size].reverse()
        }
}

extension Array where Element: Encodable {

    func asDictionaryFromArray() -> [[String: Any]] {
        var dict = [[String: Any]]()

        _ = self.map {
            if let objectDict = $0.dictionary {
                dict.append(objectDict)
            }
        }
        return dict
    }
}

extension Array where Element: Equatable {
    
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}

// MARK: - [URLQueryItem] to [String: Any]

extension Array where Element == URLQueryItem {
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        for queryItem in self {
            guard let value = queryItem.value?.toCorrectType() else { continue }
            if queryItem.name.contains("[]") {
                let key = queryItem.name.replacingOccurrences(of: "[]", with: "")
                let array = dictionary[key] as? [Any] ?? []
                dictionary[key] = array + [value]
            } else {
                dictionary[queryItem.name] = value
            }
        }
        return dictionary
    }
}
