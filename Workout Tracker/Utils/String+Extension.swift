//
//  Errors.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-12-05.
//

import Foundation

extension String: LocalizedError {
    // Extend String entity to allow error descriptions
    public var errorDescription: String? { return self }
}
