//
//  ViewController.swift
//  SearchBar
//
//  Created by Mac on 03/04/23.
//

import UIKit
struct DataModel{
    var fname : String = ""
    var lname : String = ""
    var image: String = ""
}

class ViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate{

    @IBOutlet weak var tableView: UITableView!
    var arrData = [DataModel]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        searchBarSetUp()
    }
    private func DataModelSetUp(){
        arrData = [
        DataModel(fname: "1)  Mayuri", lname: " Kale",image: "mayurik"),
        DataModel(fname: "2)  Digambar", lname: " Kale",image: "default"),
        DataModel(fname: "3)  Surekha", lname: " Kale",image: "default"),
        DataModel(fname: "4)  Rutuja", lname: " Kale",image: "default"),
        DataModel(fname: "5)  Swapnil", lname: " Kale",image: "default"),
        DataModel(fname: "6)  Pooja", lname: " Kalamkar",image: "default"),
        DataModel(fname: "7)  Panu", lname: " Bhor",image: "default"),
        DataModel(fname: "8)  Ranbir", lname: " Singh",image: "default"),
        DataModel(fname: "9)  Shaharukh", lname: " khan",image: "default"),
        DataModel(fname: "10)  Salaman", lname: " Khan", image: "default"),
        DataModel(fname: "11)  Deepika", lname: " Padukon", image: "default"),
        DataModel(fname: "12)  Ashwini", lname: " Kale", image: "default"),
        DataModel(fname: "13)  Nikhil", lname: " Kale", image: "default"),
        DataModel(fname: "14)  Dattaray", lname: " Kale", image: "default"),
        DataModel(fname: "15)  Vathasla", lname: " Kale", image: "default")]
        
    }
    private func searchBarSetUp(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }

}
extension ViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else{ return }
        if searchText == "" {
            DataModelSetUp()
        }else {
            arrData = arrData.filter{
                $0.fname.contains(searchText)
            }
        }
        tableView.reloadData()
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrData[indexPath.row].fname
        cell.detailTextLabel?.text = arrData[indexPath.row].lname
        cell.imageView?.image = UIImage(named: arrData[indexPath.row].image)
        cell.textLabel?.textColor = .systemBlue
        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        cell.detailTextLabel?.textColor = .black
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 16)
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 5
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
