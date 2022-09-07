//
//  HomePageProtocols.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation

// Main Protocols

protocol ViewToPresenterHPProtocol{
    var homepageInteractor:PresenterToInteractorHPProtocol?{get set}
    var homepageView:PresenterToViewHPProtocol?{get set}
    
    
    func loadAllThings()
    func searchThings(searchWord:String)
    func deleteThings(thing_id:Int )
    
}
protocol PresenterToInteractorHPProtocol{
    var homepagePresenter: InteractorToPresenterHPProtocol?{get set}
    
    func loadAllThings()
    func searchThings(searchWord:String)
    func deleteThings(thing_id:Int)
    
}

// Other Protocols    HP- HomePage

protocol InteractorToPresenterHPProtocol{
    
    func sendInfoToPresenter(thingsList:Array<thingsToDo>)
    
}

protocol PresenterToViewHPProtocol{
    
   func sendInfoToView(thingsList:Array<thingsToDo>)
    
}

// Router Protocol

protocol PresenterToRouterHPProtocol{
    static func createModule(ref:HomePageVC)
}

