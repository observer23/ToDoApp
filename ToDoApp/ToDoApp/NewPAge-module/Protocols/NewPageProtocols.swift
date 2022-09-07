//
//  NewPageProtocols.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation

protocol ViewToPresenterNewPageProtocol{
    var interactorNewPage:PresenterToInteractorNewPageProtocol?{get set}
    
    func saveNew(thing_what:String,thing_imp:Int)
    
    
}
protocol PresenterToInteractorNewPageProtocol{
    func save(thing_what:String,thing_imp:Int)
    
}
protocol PresenterToRouterNewPageProtocol{
    static func createModule(ref:NewThingsVC)
}

protocol ImportanceProtocol{
    var imp:Int?{get set}
}
