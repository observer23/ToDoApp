//
//  HomePagePresenter.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation

class HomepagePresenter: ViewToPresenterHPProtocol{
    var homepageInteractor: PresenterToInteractorHPProtocol?
    
    var homepageView: PresenterToViewHPProtocol?
    
    func loadAllThings() {
        homepageInteractor?.loadAllThings()
    }
    
    func searchThings(searchWord: String) {
        homepageInteractor?.searchThings(searchWord: searchWord)
    }
    
    func deleteThings(thing_id: Int) {
        homepageInteractor?.deleteThings(thing_id: thing_id)
    }
}
extension HomepagePresenter:InteractorToPresenterHPProtocol{
    func sendInfoToPresenter(thingsList: Array<thingsToDo>) {
        homepageView?.sendInfoToView(thingsList: thingsList)
    }
    
}
