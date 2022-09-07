//
//  NewPagePresenter.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation


class NewPagePresenter:ViewToPresenterNewPageProtocol{
    var interactorNewPage: PresenterToInteractorNewPageProtocol?
    
    func saveNew(thing_what: String,thing_imp: Int) {
        print("presentera geldi.")
        interactorNewPage?.save(thing_what: thing_what, thing_imp: thing_imp)
    }
    
}
