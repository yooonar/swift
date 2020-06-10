//
//  MemoListTableViewController.swift
//  RMemo
//
//  Created by yoonar on 2020/06/02.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    // 날짜 타입 default: 영어, locale 사용하여 한글로 변경 가능
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        // locale: 기본 형식을 영어 > 한글로 바꿔줌
        // f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    // 목록에 새로 저장된 메모를 불러오기 위해 새로운 메소드 추가
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        /*
        // ios 12 버전에서만 사용 가능 <- 옵저버 기능 구현 시 필요없음

         // 뷰 컨트롤러가 관리하는 뷰가 화면에 표시되기 직전에 자동으로 호출
        // 여기에서 테이블 뷰에게 목록을 업데이트 하라고 지시
        // reloadData: 데이터 소스가 전달해주는 최신 데이터로 업데이트함
        tableView.reloadData()
        
        // viewWillAppear 메소드가 실제로 호출되었는 지 확인하기 위해 로그 출력
        print(#function) // output: viewWillAppear(_:)
        */
    }
    
    // 토큰을 저장할 속성 추가
    var token: NSObjectProtocol?

    // viewDidLoad 에서 추가한 옵저버는 뷰가 화면에서 사라지기 전에 해제하거나 소멸자에서 해제함
    // 이번엔 소멸자에서 해제 처리
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    // viewDidLoad: 뷰 컨트롤러가 생성된 후에 자동으로 호출됨
    // 주로 한 번만 실행하는 초기화 코드를 넣음
    override func viewDidLoad() {
        super.viewDidLoad()

        // 옵저버를 실행하는 코드는 한 번만 실행하면 되기 때문에 보통은 viewDidLoad 에서 구현함
        // 옵저버 이름: 아까 컴포즈 뷰에서 선언한 ComposeViewController.newMemoDidInsert
        /*
         forName: 옵저버 이름 아까 컴포즈 뷰에서 선언한 ComposeViewController.newMemoDidInsert
         object: nil: 전달 파라메터가 아니면 nil 선언
         OperationQueue.main: 옵저버가 실행하는 코드가 메인 쓰레드에서 실행됨
                              ios는 쓰레드를 직접 처리하지 않고 dispatchQueue 나 OperationQueue를 통해서 처리함
         using: 클로저 실행
         notification이 전달되면 네번째 파라메터로 전달한 클로저가 세번째 파라메터로 전달한 쓰레드에서 실행됨
         */
        // notification을 구현할 때 가장 중요한 작업은 옵저버를 해제하는 것
        // 해제하지 않는 경우 앱을 실행하는 것에는 문제가 없으나 앱 내부에서는 메모리를 계속 사용하고 있음 <- 옵저버 해제 필요
        // addObserver: 옵저버를 해제할 때 사용하는 객체를 리턴해줌 <- 보통 이 객체를 token 이라고 부름
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.tableView.reloadData()
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let target = Memo.dummyMemoList[indexPath.row]
        cell.textLabel?.text = target.content

        // 데이트 타입 없는 기본 형식 Eg. 2020-06-06 23:30:49
        // cell.detailTextLabel?.text = target.insertDate.description
        
        // 데이트 타입 있는 기본 형식 Eg. 영어 > June 6, 2020 at 11:30 PM / 한글 > 2020년 6월 6일 오후 11시 30분
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
