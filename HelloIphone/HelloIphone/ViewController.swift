//
//  ViewController.swift
//  HelloIphone
//
//  Created by yoonar on 2020/05/31.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var thisLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func change(_ sender: Any) {
        thisLabel.text = "Hello iPhone!"
    }
    
}

