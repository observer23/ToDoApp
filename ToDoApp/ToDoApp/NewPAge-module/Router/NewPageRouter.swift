//
//  NewPageRouter.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation


class NewPageRouter:PresenterToRouterNewPageProtocol{
    static func createModule(ref: NewThingsVC) {
        ref.newPageObject = NewPagePresenter()
        ref.newPageObject?.interactorNewPage = NewPageInteractor()
    }
    
    
}
