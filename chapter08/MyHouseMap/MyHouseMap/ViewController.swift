//
//  ViewController.swift
//  MyHouseMap
//
//  Created by 김주엽 on 2020/08/12.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        subLabel.text = ""
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        map.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, span: Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2D(latitude: latitudeValue, longitude: longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        map.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, span: Double,
                       title: String, sub: String) {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, span: span)
        
        annotation.title = title
        annotation.subtitle = sub
        
        map.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, span: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { (placemarks, error) in
            let pm = placemarks?.first
            let country = pm!.country
            var address = country!
            
            if (pm!.locality != nil) {
                address += " "
                address += pm!.locality!
            }
            if (pm!.thoroughfare != nil) {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.titleLabel.text = "현재위치"
            self.subLabel.text = address
        })
        locationManager.stopUpdatingLocation()
    }

    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            locationManager.startUpdatingLocation()
        } else if (sender.selectedSegmentIndex == 1) {
            setAnnotation(latitudeValue: 35.663415, longitudeValue: 128.414073, span: 1,
                          title: "대구소프트웨어고등학교", sub: "대구광역시 달성군 구지면 창리로11길 93")
            
            self.titleLabel.text = "대구소프트웨어고등학교"
            self.subLabel.text = "대구광역시 달성군 구지면 창리로11길 93"
        } else if (sender.selectedSegmentIndex == 2) {
            setAnnotation(latitudeValue: 33.450811, longitudeValue: 126.570800, span: 1,
                          title: "카카오 스페이스 닷원", sub: "제주특별자치도 제주시 아라동 첨단로 242")
            
            self.titleLabel.text = "카카오 스페이스 닷원"
            self.subLabel.text = "제주특별자치도 제주시 아라동 첨단로 242"
        } else if (sender.selectedSegmentIndex == 3) {
            setAnnotation(latitudeValue: 35.874014, longitudeValue: 128.621966, span: 1,
                          title: "우리집", sub: "대구광역시 동구 신천동 200-1")
            
            self.titleLabel.text = "우리집"
            self.subLabel.text = "대구광역시 동구 신천동 200-1"
        }
    }
    
}

