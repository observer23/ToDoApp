//
//  NewThingsVC.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import UIKit

class NewThingsVC: UIViewController {

    
    @IBOutlet weak var explanationLabel: UILabel!
    
    
    @IBOutlet weak var tfEntryNewLabel: UITextField!
    @IBOutlet weak var sliderView: UISlider!
    var importance:Float?

    var newPageObject:ViewToPresenterNewPageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        explanationLabel.text=""
        NewPageRouter.createModule(ref: self)
        explanationLabel.textColor = UIColor.red
        
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        let value=sliderView.value
        
        if value < 4.0 {
            explanationLabel.text = String("Not so Special")
        }else if value<7.0{
            explanationLabel.text = String("Imm.. Problem.")
        }else if value<11.0{
            explanationLabel.text = String("NEVER FORGET!")
        }
        
        importance=sliderView.value
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        print("\(importance ?? 9999)")
        if let t=tfEntryNewLabel.text, let i=importance{
            print("burayafa gelmedi.")
            newPageObject?.saveNew(thing_what: t,thing_imp: Int(i))
        }

    }
}
