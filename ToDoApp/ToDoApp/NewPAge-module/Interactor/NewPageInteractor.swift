//
//  NewPageInteractor.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation


class NewPageInteractor:PresenterToInteractorNewPageProtocol {

    
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("thingsToDo.sqlite")
        db=FMDatabase(path: veritabaniURL.path)
    }
    
    func save(thing_what: String, thing_imp:Int) {

        db?.open()
        do{
            try db?.executeUpdate("INSERT INTO thingsToDo (things_what,things_imp) Values (?,?)", values: [thing_what,thing_imp])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    

    
    
}
