//
//  ViewController.swift
//  counter1
//
//  Created by a111 on 2020/11/12.
//  Copyright © 2020 a111. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label:UILabel!
    var label2:UILabel!
    
    lazy var button1 : UIButton = {
        let object = UIButton(type: .roundedRect) as UIButton
        object.frame = CGRect(x: 115, y: 500, width: 200, height: 40)
        object.setTitle("Tap", for: .normal)
        object.setTitleColor( .blue, for: .normal)
        object.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return object
        }()
    
    lazy var button2 : UIButton = {
        let object = UIButton(type: .roundedRect) as UIButton
        object.frame = CGRect(x: 20, y: 45, width: 100, height: 40)
        object.setTitle("Reset", for: .normal)
        object.setTitleColor( .blue, for: .normal)
        object.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return object
    }()
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label = UILabel.init(frame: CGRect(x: 10, y: 250, width: 400, height: 200))
        label.text = "0"
        label.textColor = UIColor.black
        label.font=UIFont.systemFont(ofSize: 100)
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        
        label2 = UILabel.init(frame: CGRect(x: 155, y: 50, width: 100, height: 30))
        label2.text = "Counter"
        label2.textColor = UIColor.black
        label2.font=UIFont.boldSystemFont(ofSize: 25)
        self.view.addSubview(label2)
        
        button1.addTarget(self, action: #selector(tap(_:)), for: .touchDown);        self.view.addSubview(self.button1)
        button2.addTarget(self, action: #selector(reset(_:)), for: .touchDown)
        self.view.addSubview(self.button2)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func tap(_ sender:UIButton){
        number+=1
        label.text = "\(number)"
    }
    @objc func reset(_ sender:UIButton){
        number=0
        label.text = "\(number)"
    }
    
}

