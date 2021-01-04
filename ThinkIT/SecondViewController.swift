//
//  SecondViewController.swift
//  ThinkIT
//
//  Created by Makrem chambah on 29/12/2020.
//

import Foundation
import UIKit


class SecondViewController: UIViewController {
 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var rooms : [Room] = []
    let ud = UserDefaults.standard
    var currentRoomArray : [Room] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.transition(with: tableView, duration: 3.0, options: .transitionCurlUp, animations: {self.tableView.reloadData()}, completion: nil)
        let name             = ud.string(forKey: "UserName")!
        let today            = Date()
        let formatter        = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        let formatedDate     = formatter.string(from: today)
        self.title           = String(format: "Welcome, %@!", name)
        dateLabel.text       = formatedDate
        rooms.append(Room(image: UIImage(named: "bathroom")         ?? UIImage(),name: "Bathroom"  ,numberOfDevices : 4))
        rooms.append(Room(image: UIImage(named: "bedroom")          ?? UIImage(),name: "BedRoom"   ,numberOfDevices : 6))
        rooms.append(Room(image: UIImage(named: "livingroom")       ?? UIImage(),name: "LivingRoom",numberOfDevices : 3))
        rooms.append(Room(image: UIImage(named: "mediaroom")        ?? UIImage(),name: "MediaRoom" ,numberOfDevices : 1))
        currentRoomArray = rooms
        
    setUpSearchBar()
        
    }
    
    private func setUpSearchBar(){
        searchBar.delegate = self
    }

}

extension SecondViewController:UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentRoomArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell
            else {
                return UITableViewCell()
        }
        cell.imageViewArticle.image = currentRoomArray[indexPath.row].image
        cell.NameLabel.text = currentRoomArray[indexPath.row].name
        if (currentRoomArray[indexPath.row].numberOfDevices) <= 1 {
            cell.participantLabel.text = String(currentRoomArray[indexPath.row].numberOfDevices) + " Device"
        }
        else{
            cell.participantLabel.text = String(currentRoomArray[indexPath.row].numberOfDevices) + " Devices"
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentRoomArray = rooms
            UIView.transition(with: tableView, duration: 1.0, options: .transitionCurlUp, animations: {self.tableView.reloadData()}, completion: nil)
            return
        }
        currentRoomArray = rooms.filter({r -> Bool in r.name.contains(searchText)})
        tableView.reloadData()
    }
    
    
    
}
