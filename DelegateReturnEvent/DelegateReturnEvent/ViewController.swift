//
//  ViewController.swift
//  DelegateReturnEvent
//
//  Created by yoonar on 2020/05/31.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var enteredLabel: UILabel!
    @IBAction func buttonClicked(_ sender: Any) {
        // 델리게이트 사용으로 주석처리
        // enteredLabel.text = textField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // textField 입력 값을 self(ViewController) 가 위임(delegate) 한다.
        // textField의 뒷바라지는 내(ViewController)가 할게!
        textField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // 버튼을 누르지 않고 엔터 이벤트만으로 실행 가능하다
    // textFieldShouldReturn = UITextFieldDelegate 안에 있는 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enteredLabel.text = textField.text
        return true
    }
    
}

/*
 델리게이트를 사용하지 않은 기본형
 class ViewController: UIViewController {
     @IBOutlet weak var textField: UITextField!
     @IBOutlet weak var enteredLabel: UILabel!
     @IBAction func buttonClicked(_ sender: Any) {
         enteredLabel.text = textField.text
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
     }
 }
 */
