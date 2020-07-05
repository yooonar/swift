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
