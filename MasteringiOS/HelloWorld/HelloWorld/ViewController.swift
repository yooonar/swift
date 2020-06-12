//
//  ViewController.swift
//  HelloWorld
//
//  Created by yoonar on 2020/06/12.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    @IBAction func chanbeLabel(_ sender: Any) {
        label.text = "Hello, iOS"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

