//
//  SearchableRecord.swift
//  Continuum
//
//  Created by Michael Moore on 8/28/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}
