//
//  ViewController.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var thingsTableView: UITableView!
    var thingsToDoList = [thingsToDo]()

    var homepagePresenterObject: ViewToPresenterHPProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        thingsTableView.delegate = self
        thingsTableView.dataSource = self
        
        HomepageRouter.createModule(ref: self)
        
        veritabaniKopyala()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenterObject?.loadAllThings()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let thing = sender as? thingsToDo{
                let goinVC = segue.destination as! ThingsDetailVC
                goinVC.thing = thing
            }
        }
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "thingsToDo", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("thingsToDo.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var.")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                print("VeriTabanı kopyalandı.")
                
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
}

extension HomePageVC:PresenterToViewHPProtocol{
    func sendInfoToView(thingsList: Array<thingsToDo>) {
        self.thingsToDoList = thingsList
        self.thingsTableView.reloadData()
    }
    
}
extension HomePageVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search bar kullanıldı.")
        homepagePresenterObject?.searchThings(searchWord: searchText)
    }
}
extension HomePageVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thingsToDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let thing = thingsToDoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "thingHucre", for: indexPath) as! ThingHucreTableViewCell
        
        
        cell.thingCellLabel.text = "\(thing.things_what!)"
        cell.thingCellLabel.textColor = .black
        let value=thing.things_imp!
        if value<4{
            cell.importanceImageView.image = UIImage(named: "white")
    }else if 3 < value && value < 6 {
            cell.importanceImageView.image = UIImage(named: "exclamation")
            
        }else if 6<value && value<11{
            cell.importanceImageView.image = UIImage(named: "exclamation2")
            
        }
        
        cell.layer.cornerRadius = 25
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thing = thingsToDoList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: thing)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "DEL"){ (contextualAction,view,bool) in
            let thing = self.thingsToDoList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Delete the \(thing.things_what!) ?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "Cancel", style: .cancel){action in}
            let evetAction = UIAlertAction(title: "Yes!", style: .destructive){action in
                self.homepagePresenterObject?.deleteThings(thing_id: thing.things_id!)
                
            }
        
        alert.addAction(iptalAction)
        alert.addAction(evetAction)
        self.present(alert, animated: true)

        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
        
    }

    
}
