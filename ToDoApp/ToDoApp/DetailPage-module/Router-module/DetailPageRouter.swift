//
//  DetailPageRouter.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation


class detailPageRouter:PresenterToRouterDetailProtocol{
    static func createModule(ref: ThingsDetailVC) {
        ref.detailPageObject = detailPagePresenter()
        ref.detailPageObject?.detailpageInteractor = detailPageInteractor()
    }
    
    
}
