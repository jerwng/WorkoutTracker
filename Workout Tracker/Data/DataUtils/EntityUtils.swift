//
//  DataUtils.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-10-02.
//

import Foundation
import CoreData

struct EntityUtils {
    func getEntityRecordsCount(context: NSManagedObjectContext, entityName: String) -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let count = try context.count(for: fetchRequest)
            return count
        } catch {
            print(error.localizedDescription)
        }

        return -1
    }
}
