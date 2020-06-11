//
//  MapViewController.swift
//  Tourism System
//
//  Created by Mohamed Ali on 6/10/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView:MKMapView!
    
    let location = CLLocationManager()
    
    var flag:Int?
    var long:Double?
    var lati:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch flag {
        case 1:
            lati = 31.25654
            long = 32.28411
            MakeLocation(Title: "Tourism Location", SubTitle: "Portsaid Address", lati: 31.25654, long: 32.28411)
            break
        case 2:
            lati = 51.510357
            long = -0.116773
            MakeLocation(Title: "Toursim Location", SubTitle: "London Address", lati: 51.510357, long: -0.116773)
            break
        case 3:
            lati = 25.197525
            long = 55.274288
            MakeLocation(Title: "Toursim Location", SubTitle: "United Arab Emiraties Address", lati: 25.197525, long: 55.274288)
            break
        default:
            break
        }
    }
    
    // MARK:- TODO:- This Method For Making a Pin in Map.
    func MakeLocation (Title:String,SubTitle:String,lati:Double,long:Double)  {
        
        let anotation = MKPointAnnotation()
        
        anotation.coordinate = CLLocationCoordinate2D(latitude: lati, longitude: long)
        mapView.addAnnotation(anotation)
        anotation.title = Title
        anotation.subtitle = SubTitle
        let range = MKCoordinateRegion(center: anotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(range, animated: true)
        
    }
    
    // MARK:- TODO:- This Action Method for showing directions
    @IBAction func ShowDurection(_ sender: Any) {
        print("Directions is here!")
        
        location.delegate = self
        location.desiredAccuracy = kCLLocationAccuracyBest
        location.requestWhenInUseAuthorization()
        location.startUpdatingLocation()
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let l = locations[locations.count - 1]
        if l.horizontalAccuracy > 0 {
            location.stopUpdatingLocation()
            location.delegate = nil
            
            print(String(l.coordinate.longitude))
            print(String(l.coordinate.latitude))
            
            // MAKE Any thing with cordinates.
            MakeLocation(Title: "Your Location", SubTitle: "You Lives here", lati: l.coordinate.longitude, long: l.coordinate.latitude)
            
            let sourcePlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: l.coordinate.latitude, longitude: l.coordinate.longitude))
            
            let destinationPlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: self.lati!, longitude: self.long!))
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
            directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
            directionRequest.transportType = .automobile
            
            let direction = MKDirections(request: directionRequest)
            direction.calculate { (direction, error) in
                guard let directionResponse = direction else{
                    if error != nil {
                        print("Error in drawing! \((error?.localizedDescription)!)")
                    }
                    return
                }
                
                let route = directionResponse.routes[0]
                self.mapView.addOverlay(route.polyline,level: .aboveRoads)
                
                let rect = route.polyline.boundingMapRect
                self.MakeLocation(Title: "Your Location", SubTitle: "You Live here", lati: l.coordinate.latitude, long: l.coordinate.longitude)
                self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
        
        self.mapView.delegate = self
    }
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}

extension MapViewController: MKMapViewDelegate {
    
    // MARK:- mapkit delegates
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
}
