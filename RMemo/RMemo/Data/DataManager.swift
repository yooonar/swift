//
//  DataManager.swift
//  RMemo
//
//  Created by yoonar on 2020/07/05.
//  Copyright © 2020 yoonar. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    // 메모앱 데이터베이스 구현을 위한 코어 데이터 클래스 생성
    
    // 공유 인스턴스를 저장할 타입 프로퍼티를 추가
    static let shared = DataManager()
    
    // 기본 생성자 추가, private 선언 ← 이렇게하면 앱 전체에서 하나의 인스턴스를 공유할 수 있다.
    // 싱글톤(Singleton) 은 iOS 에서 자주 활용하는 패턴임
    private init() {
        
    }
    
    // 코어 데이터에서 실행하는 대부분의 작업은 context 객체가 담당한다.
    // 우리가 직접 context를 만들수도 있지만 이번에는 기본적으로 생성되는 context 를 그대로 사용할 것
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var memoList = [Memo]()
    
    // 데이터를 데이터베이스에서 읽어오는 것 = iOS 에서는 fetch 라고 한다.
    // 데이터를 데이터베이스에서 읽어오려면 먼저 fetch Request 를 만들어야 한다.
    func fetchMemo() {
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        
        // 날짜 내림차순 정렬
        let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        
        do {
            memoList = try mainContext.fetch(request)
        } catch {
            print(error)
        }
        
    }
    
    
    func addNemMemo (_ memo: String?) {
        // 새로운 메모 인스턴스 생성
        // Memo: 이 메모 클래스는 우리가 만든 클래스가 아니라 코어 데이터가 만든 클래스이다.
        // 그래서 새로운 인스턴스를 만들 때 생성자로 context 를 전달해야한다.
        // 이렇게하면 데이터베이스에 메모를 저장하는데 필요한 비어있는 인스턴스가 생성된 것이다.
        let newMemo = Memo(context: mainContext)
        
        // 비어있는 인스턴스에 값 채우기
        // parameter 로 전달받은 memo 를 content 에 저장
        newMemo.content = memo
        
        // 현재 날짜를 insertDate 에 저장
        newMemo.insertDate = Date()
        
        // 메모를 저장하고나면 데이터를 업데이트 해주기 위해 memoList 배열을 새로고침 해준다.
        // .append: 뒷부분에 추가, .insert: 앞부분에 추가
        memoList.insert(newMemo, at: 0)
        
        // 이렇게 새로운 메모 인스턴스를 생성했다고 해서 Memo 가 데이터베이스에 저장되는 것은 아니다.
        // 실제로 데이터베이스 파일을 저장하고 싶다면 context 를 저장해야한다.
        // context 를 저장하는 메소드는 아래에 있는 saveContext 이다. 이 메소드를 그대로 호출하면 된다.
        saveContext()
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RMemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
