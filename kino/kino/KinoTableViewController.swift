//
//  KinoTableViewController.swift
//  kino
//
//  Created by 903-21i on 20.02.2023.
//

import UIKit
import MapKit

class KinoTableViewController: UITableViewController {
    
    var arrayCinema:[Cinema] = []
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Запрашиваем разрешение на использование местоположения пользователя
        locationManager.requestWhenInUseAuthorization()

        arrayCinema.append(Cinema(name: "Cinemax Dostyk Multiplex", address: "г. Алматы, Самал-2, д. 111, уг.ул. Жолдасбекова, ТРЦ «Достык Плаза»", picture: "dostyk", longitude: 76.957576, latitude: 43.233518))
        
        arrayCinema.append(Cinema(name: "Lumiera Cinema (ЦУМ)", address: "г. Алматы, пр. Абылай хана, 62, «Арбат»", picture: "lumiera", longitude: 76.9377233, latitude: 43.2629379))
        
        arrayCinema.append(Cinema(name: "Kinoforum 10 (ТРЦ Forum)", address: "г. Алматы, ул. Сейфуллина, 617, ТРЦ «Forum Almaty», 5-й этаж", picture: "kinoforum", longitude: 76.936692, latitude: 43.234228))
        
        arrayCinema.append(Cinema(name: "Kinopark 11 (Есентай) IMAX", address: "г. Алматы, пр. Аль-Фараби, 77/8, ТЦ «Esentai Mall»", picture: "kinopark", longitude: 76.927729, latitude: 43.218485))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCinema.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        nameLabel.text = arrayCinema[indexPath.row].name
        
        let addressLabel = cell.viewWithTag(1001) as! UILabel
        addressLabel.text = arrayCinema[indexPath.row].address
        
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayCinema[indexPath.row].picture)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CinemaViewController") as! ViewController
        
        vc.cinema = arrayCinema[indexPath.row]
        
        navigationController?.show(vc, sender: nil)
    }
   
}
