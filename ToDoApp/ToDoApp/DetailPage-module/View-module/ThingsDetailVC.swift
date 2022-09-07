//
//  ThingsDetailVC.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import UIKit

class ThingsDetailVC: UIViewController {


    @IBOutlet weak var titleDetailLabel: UILabel!
    
    @IBOutlet weak var tfEntryUpdate: UITextField!
    
    
    var thing:thingsToDo?
    
    var detailPageObject:ViewToPresenterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t=thing{
            
            
            titleDetailLabel.text = t.things_what
            
            detailPageRouter.createModule(ref: self)
        }
        


    }
    

    @IBAction func buttonSave(_ sender: Any) {
        if let t_what = tfEntryUpdate.text , let t=thing{
            detailPageObject?.update(thing_id: t.things_id!, thing_what: t_what)
        }
        
    }
    
}
