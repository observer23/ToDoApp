//
//  HomePageInteractor.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import Foundation


class HomePageInteractor:PresenterToInteractorHPProtocol{
    var homepagePresenter: InteractorToPresenterHPProtocol?
    
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("thingsToDo.sqlite")
        db=FMDatabase(path: veritabaniURL.path)
    }
    
    func loadAllThings() {
        
        var liste = [thingsToDo]()
        db?.open()
        do{
            let q = try db!.executeQuery("SELECT * From thingsToDo", values: nil)
            while q.next(){
                let thing = thingsToDo(things_id: Int(q.string(forColumn: "things_id"))!, things_what: q.string(forColumn: "things_what")!, things_imp: Int(q.string(forColumn: "things_imp"))!)
                liste.append(thing)
            }
            
            homepagePresenter?.sendInfoToPresenter(thingsList: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
    }
    
    func searchThings(searchWord: String) {
        var liste = [thingsToDo]()
        db?.open()
        do{
            let q = try db!.executeQuery("SELECT * FROM thingsToDo where things_what like '%\(searchWord)%'", values: nil)
            
            while q.next(){
                let thing = thingsToDo(things_id: Int(q.string(forColumn: "things_id"))!, things_what: q.string(forColumn: "things_what")!, things_imp: Int(q.string(forColumn: "things_imp"))!)
                liste.append(thing)
            }
            
            homepagePresenter?.sendInfoToPresenter(thingsList: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func deleteThings(thing_id: Int) {

        db?.open()
        do{
           try db!.executeUpdate("Delete FROM thingsToDo where things_id = ?", values: [thing_id])
            
            loadAllThings()
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    
}
