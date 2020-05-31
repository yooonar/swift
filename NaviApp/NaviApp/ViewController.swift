//
//  ViewController.swift
//  NaviApp
//
//  Created by yoonar on 2020/05/31.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func ClickMoveBtn(_ sender: Any) {
        // 버튼 이벤트에서 해야할 일
        // 1. 스토리보드에서 이동할 컨트롤러(ViewController -> DetailController)를 찾는다. : DetailController
        // 2. 실제로 컨트롤러를 이동시킨다.
        
        // 상수에 컨트롤러 넣기
        // 얘가 빈값인지 아닌지 몰라서(java: null, swift: nil) if문으로 묶어준다 = 옵셔널 바인딩
        if let controller = self.storyboard?.instantiateViewController(identifier: "DetailController") {
            // 컨트롤러 이동시키기
            // 내비바에있는 컨트롤러에서 버튼을 누르면 디테일 컨트롤러가 Add 되도록 추가하는 구문
            self.navigationController?.pushViewController(controller, animated: true)
        }


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

