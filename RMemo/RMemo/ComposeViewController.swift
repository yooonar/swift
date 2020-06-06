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

    @IBOutlet weak var memoTextView: UITextView!

    @IBAction func save(_ sender: Any) {
        // 텍스트뷰에 저장된 내용을 가져와 기존에 불러왔던 목록 배열인 dummyMemoList 배열에 저장해야함
        
        // 텍스트 뷰에 저장된 내용을 상수로 지정
        guard let memo = memoTextView.text, memo.count > 0 else {
            // 경고창 표시
            alert(message: "메모를 입력하세요.")
            return
        }
        
        // 새로운 인스턴스 생성, 배열에 저장
        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        
        // 저장 후 새 메모 화면 닫기
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
