//
//  Builder.swift
//  UnitTest_Table
//
//  Created by Galina Iaroshenko on 15.12.2022.
//

import UIKit

protocol Builder {
    static func createTasksVC() -> UIViewController
    static func createTaskDetailVC(task: Task) -> UIViewController
}

class MainFactory: Builder {
    static func createTasksVC() -> UIViewController {
        let createdVC = TaskViewController()
        return createdVC
    }
    
    
    static func createTaskDetailVC(task: Task) -> UIViewController {
        let createdDVC = DetailViewController()
        createdDVC.task = task
        return createdDVC
    }
}
