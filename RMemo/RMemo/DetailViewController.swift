//
//  DetailViewController.swift
//  RMemo
//
//  Created by yoonar on 2020/06/14.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

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
            return cell
        case 1: // 2번 셀: 날짜
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            return cell
        default: // 오류
            fatalError()
        }
    }
    
    
}
