//
//  ViewController.swift
//  helloSwiftProject
//
//  Created by yoonar on 2020/06/15.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!

    @IBAction func changeLabel(_ sender: Any) {
        lbl.text = "Hello, Swift"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

