//
//  ViewController.swift
//  todoApp
//
//  Created by a111 on 2020/11/21.
//  Copyright © 2020 a111. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,AddTask,ChangeButton {
    
    var tasks: [Task] = []
    var tasks2: [Task] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "未完成"+" \(tasks.count)"
        case 1: return "已完成"+" \(tasks2.count)"
        default: return nil
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return tasks.count
        case 1: return tasks2.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        if indexPath.section == 0 {
        cell.taskNameLabel.text = tasks[indexPath.row].name
        if tasks[indexPath.row].checked {
            cell.checkBox.setBackgroundImage(UIImage(named: "check"), for: UIControl.State.normal)
        } else {
            cell.checkBox.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)
        }
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.section = indexPath.section
        cell.tasks = tasks
        return cell
        }else{
            cell.taskNameLabel.text = tasks2[indexPath.row].name
            if tasks2[indexPath.row].checked {
                cell.checkBox.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)
            } else {
                cell.checkBox.setBackgroundImage(UIImage(named: "check"), for: UIControl.State.normal)
            }
            cell.delegate = self
            cell.indexP = indexPath.row
            cell.section = indexPath.section
            cell.tasks = tasks2
            return cell
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            if indexPath.section == 0 {
            tasks.remove(at: indexPath.row)
            }else{
            tasks2.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskViewController
        vc.delegate = self
    }
    
    func addTask(name: String) {
        tasks.append(Task(name2: name))
        tableView.reloadData()
    }
    func changebutton(checked: Bool, section: Int?, index: Int?) {
        switch(section){
        case 0: do { self.tasks[index!].checked = checked
            tasks2.append(Task(name2: tasks[index!].name))
            self.tasks.remove(at: index!)
            }
        default : do { self.tasks2[index!].checked = checked
            tasks.append(Task(name2: tasks2[index!].name))
            self.tasks2.remove(at: index!)
            }
                    }
        tableView.reloadData()
        
    }
}

class Task {
    var name = ""
    var checked = false
    
    convenience init(name2: String) {
        self.init()
        self.name = name2
    }
}
