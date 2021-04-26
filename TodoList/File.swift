//
//  File.swift
//  TodoList
//
//  Created by JoHsun Chao on 2021/3/23.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable{
    var id = String()
    var todoItem = String()
}

class TaskStore : ObservableObject{
    @Published var tasks = [Task]()
}
