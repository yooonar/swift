//
//  DetailViewController.swift
//  RMemo
//
//  Created by yoonar on 2020/06/14.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 이전 화면에서 전달한 메모를 저장할 속성을 추가
    // 뷰 컨트롤러가 초기화되는 시점에서는 값이 없기 때문에 옵셔널(? 표기) 로 선언
    // MemoListTableViewController->prepare 에서 이곳으로 전달해줌
    var memo: Memo?
    
    // 날짜 포맷 변경
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        // locale: 기본 형식을 영어 > 한글로 바꿔줌
        // f.locale = Locale(identifier: "Ko_kr")
        return f
    }()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 툴바에 있는 버튼을 탭할 때 세그웨이 실행
        // sender 로 툴바에 있는 버튼이 전달됨
        if let vc = segue.destination.children.first as? ComposeViewController {
            // 내비게이션 컨트롤러가 관리하는 첫번째 뷰컨트롤러(ConposeViewController) 로 메모가 전달됨 
            vc.editTarget = memo
        }
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

// DetailViewController 가 UITableViewDataSource 를 채용한다고 선언해야함
// 메모 앱의 데이터 소스를 가져오기 위해 선언이 필요함
extension DetailViewController: UITableViewDataSource {
    
    // UITableViewDataSource 의 필수 메소드들 numberOfRowsInSection,cellForRowAt indexPath

    // tableView가 표시할 셀 숫자를 물어볼 때 호출하는 메소드
    // 지금은 2개만 표시할 예정이라 2만 리턴
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // 1: 메모, 2: 날짜 <- 총 2개
    }
    
    // tableView가 어떤 셀을 표시할 지 물어볼 때 호출하는 메소드
    // 1번 셀: 메모, 2번 셀: 날짜 표시
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath.row = 몇번째 셀인 지 확인 가능
        switch indexPath.row {
        case 0: // 1번 셀: 메모
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            cell.textLabel?.text = memo?.content
            return cell
        case 1: // 2번 셀: 날짜
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            // formatter.string(from) <- from 에는 옵셔널 값을 전달할 수 없다.
            // 하지만 우리는 옵셔널 값을 저장해야하기 때문에 옵셔널 바인딩을 사용하거나 formatter.string(for) 를 사용해야한다.
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            return cell
        default: // 오류
            fatalError()
        }
    }
    
    
}
