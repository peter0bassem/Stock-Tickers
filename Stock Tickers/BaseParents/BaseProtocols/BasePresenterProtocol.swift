//
//  BasePresenterProtocol.swift
//  TeacherOnDemand
//
//  Created by Peter Bassem on 21/03/2022.
//

import Foundation

protocol BasePresenterProtocol: AnyObject {
    func secondsToHoursMinutesSeconds (milliseconds: Int) -> (hour: Int, minute: Int, second: Int)
    func filterDictionary(_ dictionary: inout [String: Any]) -> [String: Any]
}
