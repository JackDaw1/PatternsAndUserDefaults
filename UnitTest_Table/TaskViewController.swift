//
//  TaskViewController.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 05.12.2022.
//
import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let task = TaskAPI.getTask() // model
    let taskTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(taskTableView)
        
        taskTableView.translatesAutoresizingMaskIntoConstraints = false
        
        taskTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        taskTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        taskTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        taskTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
        
        taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "taskCell")
        
        
        
        
        navigationItem.title = "Task"
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.task = task[indexPath.row]
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let task = task[indexPath.row]
        let task = task[indexPath.row]
        //let detailVC = DetailViewController()
        let detailVC =  MainFactory.createTaskDetailVC(task: task)
        //detailVC.task = task
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
}
