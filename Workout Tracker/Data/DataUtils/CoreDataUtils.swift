//
//  CoreDataUtils.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-10-04.
//

import Foundation

struct CoreDataUtils {
    
    // Print SQLite filepath, since each build can change location of the file, call this function to find the file's location for the current build
    func getCoreDataDBPath() {
            let path = FileManager
                .default
                .urls(for: .applicationSupportDirectory, in: .userDomainMask)
                .last?
                .absoluteString
                .replacingOccurrences(of: "file://", with: "")
                .removingPercentEncoding

            print("Core Data DB Path :: \(path ?? "Not found")")
        }
}
