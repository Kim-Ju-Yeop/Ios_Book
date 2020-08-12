//
//  ViewController.swift
//  Map
//
//  Created by 김주엽 on 2020/08/12.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var IblLocationInfo1: UILabel!
    @IBOutlet var IblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IblLocationInfo1.text = ""
        IblLocationInfo2.text = ""
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        myMap.showsUserLocation = true
        locationManager.startUpdatingLocation()
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { (placemarks, error) in
            let pm = placemarks?.first
            let country = pm!.country
            var address = country!
            
            if (pm!.locality != nil) {
                address += " "
                address += pm!.locality!
            }
            
            if  (pm!.thoroughfare != nil) {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.IblLocationInfo1.text = "현재위치"
            self.IblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double,
                       title strTitle: String, subtitle strSubTitle: String) {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        
        myMap.addAnnotation(annotation)
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            locationManager.startUpdatingLocation()
        } else if (sender.selectedSegmentIndex == 1) {
            setAnnotation(latitudeValue: 35.663415, longitudeValue: 128.414073, delta: 1,
                          title: "대구소프트웨어고등학교", subtitle: "대구광역시 달성군 구지면 창리로11길 93")
            
            self.IblLocationInfo1.text = "대구소프트웨어고등학교"
            self.IblLocationInfo2.text = "대구광역시 달성군 구지면 창리로11길 93"
        } else if (sender.selectedSegmentIndex == 2) {
            setAnnotation(latitudeValue: 33.450811, longitudeValue: 126.570800, delta: 1,
                          title: "카카오 스페이스 닷원", subtitle: "제주특별자치도 제주시 아라동 첨단로 242")
            
            self.IblLocationInfo1.text = "카카오 스페이스 닷원"
            self.IblLocationInfo2.text = "제주특별자치도 제주시 아라동 첨단로 242"
        }
    }
}

