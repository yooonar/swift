//
//  ViewController.swift
//  SampleWebView
//
//  Created by yoonar on 2020/05/31.
//  Copyright © 2020 yoonar. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 1. 웹뷰 url 을 찾는다 (이동할 웹주소)
        // 2. url 을 request한다
        // 3. request 한 것을 load한다
        
        let urlString = "https://www.google.com"

        // url 값이 비어있을 수도 있지만(nil) if 문으로 있을 때 넣어주기 때문에 값이 항상 있을 거다 라고 정의해주는 것 = 언랩핑 unwrap
        // if 로 상수의 nil 여부를 통해 처리하는 것 = 옵셔널 바인딩
        if let url = URL(string: urlString) {
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }

        /*
        var abc = "1"
        var abc1 :String? = nil //  값이 비어있을 수도 있다. java: null, swift: nil
        // let aaa = abc! // if 처럼 길게 쓰지 않고 강제로 언랩핑 처리(느낌표로 처리), abc1은 nil 이기 때문에 오류가 난다 <- 이 방법 비추, 옵셔널 바인딩 쓰세요!
        if let unwrap = abc1 {
            // unwrap 변수를 사용
        }
        let abc2 = "2"
        */
    }

}

