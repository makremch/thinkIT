//
//  SecondViewController.swift
//  ThinkIT
//
//  Created by Makrem chambah on 29/12/2020.
//

import Foundation
import UIKit


class SecondViewController: UIViewController {
 
    
    @IBOutlet weak var dateLabel: UILabel!
  
    var rooms : [Room] = []
    let ud = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
  

}

extension SecondViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell
            else {
                return UITableViewCell()
        }
        cell.imageViewArticle.image = rooms[indexPath.row].image
        cell.NameLabel.text = rooms[indexPath.row].name
        if (rooms[indexPath.row].numberOfDevices) <= 1 {
            cell.participantLabel.text = String(rooms[indexPath.row].numberOfDevices) + " Device"
        }
        else{
            cell.participantLabel.text = String(rooms[indexPath.row].numberOfDevices) + " Devices"
        }
        
        
        return cell
    }
    
    
}
