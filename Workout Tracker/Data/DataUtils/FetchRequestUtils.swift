//
//  FetchRequestUtils.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-28.
//

import Foundation
import CoreData

class FetchRequestUtils {
    static func getActiveMesocycleFetchRequest() -> NSFetchRequest<Mesocycle> {
        let fetchRequest: NSFetchRequest<Mesocycle> = Mesocycle.fetchRequest()
        let predicate = NSPredicate(format: "isComplete == %@", NSNumber(value: false))
        
        fetchRequest.predicate = predicate
        
        return fetchRequest
    }


}
