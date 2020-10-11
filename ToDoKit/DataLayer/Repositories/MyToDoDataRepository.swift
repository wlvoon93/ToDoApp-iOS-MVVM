//
//  MyToDoDataRepository.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation

public class MyToDoDataRepository: ToDoDataRepository {
    
    let dataStore: ToDoDataStore
    
    
    // MARK: - Methods
    public init(dataStore: ToDoDataStore) {
        self.dataStore = dataStore

    }
    
    public func readTodoFromDB() -> [ToDoListItem] {
        return dataStore.readTodoFromDB()
    }
    
    public func writeToDoToDB(date: Date, item: String) {
        return dataStore.writeToDoToDB(date: date, item: item)
    }
}
