//
//  ComposeViewController.swift
//  RMemo
//
//  Created by yoonar on 2020/06/06.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBAction func close(_ sender: Any) {
        // dismiss: 화면을 닫을 때 효과, 보통 화면을 열 땐 모달창
        // animate true: 화면을 닫을 때 애니메이션 효과 주는 것
        // completion: 화면을 닫은 후 실행하기 위한 것. 기존에는 별도의 클로저 실행하지만 이번엔 아무것도 전송하지 않을 거라 nil 처리
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
