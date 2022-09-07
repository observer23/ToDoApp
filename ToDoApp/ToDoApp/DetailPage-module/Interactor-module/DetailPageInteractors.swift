//
//  DetailPageInteractors.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation


class detailPageInteractor:PresenterToInteractorDetailProtocol{
    
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("thingsToDo.sqlite")
        db=FMDatabase(path: veritabaniURL.path)
    }
    
    func doUpdate(thing_id: Int, thing_what: String) {
        db?.open()
        do{
            try db?.executeUpdate("UPDATE thingsToDo SET things_what=? WHERE things_id=?", values: [thing_what,thing_id])
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
