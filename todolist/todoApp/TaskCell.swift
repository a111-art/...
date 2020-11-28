//
//  TaskCell.swift
//  todoApp
//
//  Created by a111 on 2020/11/21.
//  Copyright © 2020 a111. All rights reserved.
//

import UIKit
protocol ChangeButton {
    func changebutton(checked: Bool, index: Int?)
}
class TaskCell: UITableViewCell {
    var delegate: ChangeButton?
    var indexP: Int?
    var tasks: [Task]?
    var tasks2: [Task]?
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBAction func checkBoxAction(_ sender: Any) {
            if tasks![indexP!].checked {
            delegate?.changebutton(checked: false, index: indexP!)
          } else {
            delegate?.changebutton(checked: true, index: indexP!)
        }
        if tasks2 != nil {
            if tasks2![indexP!].checked {
            delegate?.changebutton(checked: false, index: indexP!)
            } else {
            delegate?.changebutton(checked: true, index: indexP!)
        }
     }
    }
    
}

