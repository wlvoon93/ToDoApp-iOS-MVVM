//
//  ToDoListItem.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import Foundation
import RealmSwift

public class ToDoListItem: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}
