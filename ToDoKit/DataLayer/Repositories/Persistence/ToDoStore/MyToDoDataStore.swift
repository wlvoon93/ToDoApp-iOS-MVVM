//
//  MyToDoDataStore.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation
import RealmSwift

public class MyToDoDataStore: ToDoDataStore{
    
//    private let realm = try! Realm()
    
//    private
    
    public var completionHandler: (() -> Void)?

    // MARK: - Methods
    public init() {
        
    }
    
    public func readTodoFromDB() -> [ToDoListItem]{
        let realm = try! Realm()
        let data:[ToDoListItem]
        data = realm.objects(ToDoListItem.self).map({ $0 })
        
        return data
    }
    
    public func writeToDoToDB(date: Date, item: String){
        let realm = try! Realm()
        realm.beginWrite()
        
        let newItem = ToDoListItem()
        newItem.date = date
        newItem.item = item
        realm.add(newItem)
        
        try! realm.commitWrite()
    }
    
    public func removeToDo(item:ToDoListItem?){
        guard let theItem = item else{
            return
        }
        
        let realm = try! Realm()
        realm.beginWrite()
        
        realm.delete(theItem)
        
        try! realm.commitWrite()
    
    }
}
