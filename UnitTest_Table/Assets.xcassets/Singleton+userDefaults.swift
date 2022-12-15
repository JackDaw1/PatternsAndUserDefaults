//
//  Singleton.swift
//  UnitTest_Table
//
//  Created by Galina Iaroshenko on 15.12.2022.
//

import UIKit

enum UserDefaultsKeys: String {
    case hasSavedData = "has_saved_data"
    case allTasks = "all_tasks"
}

final class UserInfoStorage {
    static let shared =  UserInfoStorage()
    func hasSavedDataForRestore() -> Bool {
        return UserDefaults.standard.value(forKey: UserDefaultsKeys.hasSavedData.rawValue) as? Bool ?? false
    }
    
    func hasSavedDataForRestore(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: UserDefaultsKeys.hasSavedData.rawValue)
    }
    
    func setTasks(tasks: [Task]?) {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: UserDefaultsKeys.allTasks.rawValue)
        }
    }
    
    func getTasks() -> [Task]? {
        
        guard let savedTasksData = UserDefaults.standard.object(forKey: UserDefaultsKeys.allTasks.rawValue) as? Data,
              let savedTasks = try? JSONDecoder().decode([Task].self, from: savedTasksData) else { return nil }
        
        return savedTasks
    }
}
