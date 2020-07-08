//
//  ComposeViewController.swift
//  RMemo
//
//  Created by yoonar on 2020/06/06.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    // 보기 화면에서 전달한 메모를 이 속성에 저장
    var editTarget: Memo?

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
        
        if let target = editTarget { // edit
            target.content = memo
            DataManager.shared.saveContext()
            
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
        } else { // insert
            // 새로운 인스턴스 생성, 배열에 저장
            /*
            // 2020-07-05 DB 구현하면서 주석처리
            let newMemo = Memo(content: memo)
            Memo.dummyMemoList.append(newMemo)
            */
            DataManager.shared.addNemMemo(memo)
            
            // 화면을 닫기 전에 notification을 전달
            // NotificationCenter.default.post에서 전달한 notification을 처리해야하는데 옵저버를 등록하고 필요한 코드를 구현하는 방식으로 처리: 라디오 주파수 맞추기
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        }
        
        // 저장 후 새 메모 화면 닫기
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰 컨트롤러가 실행된 다음 실행됨
        // 메모 생성과 수정일 때 타이틀을 유동적으로 바꿔준다
        if let memo = editTarget { // edit
            navigationItem.title = "메모 편집"
            memoTextView.text = memo.content
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
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

// notification: 라디오 방송: 주파수를 통해 구분 Eg. 91.9 107.7 ..
// notificationCenter: 라디오 방송국: 이름으로 구분 Eg. KBS, SBS..
extension ComposeViewController {
    // notification 이름 추가
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    
    static let memoDidChange  = Notification.Name(rawValue: "memoDidChange")
}
