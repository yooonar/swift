//
//  UIViewController+Alert.swift
//  RMemo
//
//  Created by yoonar on 2020/06/06.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", message: String) {
        
        // 경고창 UI
        // .alert: 경고창, .actionSheet: 세가지 이상의 옵션이 있을 때 선택하는 화면
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // 경고창 버튼
        // .default: 기본 디자인
        // handler: 경고창 버튼을 누른 후 실행할 이벤트
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        // 새롭게 추가한 okAction 액션을 alert 컨트롤러에 추가해주어야 함
        alert.addAction(okAction)
        
        // present 메소드로 경고창을 화면에 표시
        present(alert, animated: true, completion: nil)
    }
}
