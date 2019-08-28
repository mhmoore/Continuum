//
//  DateHelper.swift
//  Continuum
//
//  Created by Michael Moore on 8/27/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation

class DateHelper {
    
    static let shared = DateHelper()
    
    private init() {}
    
    let dateFormatter = DateFormatter()
    
    func mediumStringFor(date: Date) -> String {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}
