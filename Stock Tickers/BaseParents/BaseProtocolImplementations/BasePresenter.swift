//
//  BasePresenter.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//

import Foundation

class BasePresenter: BasePresenterProtocol {
    
    func secondsToHoursMinutesSeconds (milliseconds: Int) -> (hour: Int, minute: Int, second: Int) {
      return (milliseconds / 3600, (milliseconds % 3600) / 60, (milliseconds % 3600) % 60)
    }
    
    func filterDictionary(_ dictionary: inout [String: Any]) -> [String: Any] {
        for (key, value) in dictionary {
            if let valueString = value as? String {
                if valueString == "" {
                    dictionary.removeValue(forKey: key)
                }
            }
        }
        return dictionary
    }
}

