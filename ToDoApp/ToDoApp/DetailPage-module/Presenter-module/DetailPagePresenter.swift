//
//  DetailPagePresenter.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation


class detailPagePresenter:ViewToPresenterDetailProtocol{
    var detailpageInteractor: PresenterToInteractorDetailProtocol?
    
    func update(thing_id: Int, thing_what: String) {
        detailpageInteractor?.doUpdate(thing_id: thing_id, thing_what: thing_what)
    }
    
    
}
