//
//  ViewController.swift
//  kino
//
//  Created by 903-21i on 20.02.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapview: MKMapView!
    
    var cinema = Cinema()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pictureImageView.image = UIImage(named: cinema.picture)
        
        nameLabel.text = cinema.name
        
        addressLabel.text = cinema.address
        
        // Новые координаты для метки на карте
        let lat:CLLocationDegrees = cinema.latitude
        let long:CLLocationDegrees = cinema.longitude
        
        // Создаем координта передавая долготу и широту
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        // Создаем метку на карте
        let anotation = MKPointAnnotation()
        
        // Задаем коортинаты метке
        anotation.coordinate = location
        // Задаем название метке
        anotation.title = cinema.name
        // Задаем описание метке
        anotation.subtitle = cinema.address
        
        // Добавляем метку на карту
        mapview.addAnnotation(anotation)
        
        // Дельта - насколько отдалиться от координат пользователя по долготе и широте
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        
        // Создаем область шириной и высотой по дельте
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        // Создаем регион на карте с моими координатоми в центре
        let region = MKCoordinateRegion(center: location, span: span)
        
        // Приближаем карту с анимацией в данный регион
        mapview.setRegion(region, animated: true)
    }

    @IBAction func openMap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        vc.cinema = cinema
        
        navigationController?.show(vc, sender: nil)
    }
    
}

