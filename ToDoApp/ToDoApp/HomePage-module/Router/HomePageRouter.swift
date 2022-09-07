//
//  HomePageRouter.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation

class HomepageRouter:PresenterToRouterHPProtocol{
    static func createModule(ref: HomePageVC) {
        let presenter=HomepagePresenter()
        
        // view
        ref.homepagePresenterObject = presenter
        // presenter
        ref.homepagePresenterObject?.homepageView = ref
        ref.homepagePresenterObject?.homepageInteractor = HomePageInteractor()
        //ınteractor
        ref.homepagePresenterObject?.homepageInteractor?.homepagePresenter = presenter
        
    }
    
}
