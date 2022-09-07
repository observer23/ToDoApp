//
//  DetailPageProtocols.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation

//Main Protocols
// Main Protocols

protocol ViewToPresenterDetailProtocol{
    var detailpageInteractor:PresenterToInteractorDetailProtocol?{get set}
    func update(thing_id:Int,thing_what:String)
    
}
protocol PresenterToInteractorDetailProtocol{
    func doUpdate(thing_id:Int,thing_what:String)
    
}


// Router Protocol

protocol PresenterToRouterDetailProtocol{
    static func createModule(ref:ThingsDetailVC)
}
