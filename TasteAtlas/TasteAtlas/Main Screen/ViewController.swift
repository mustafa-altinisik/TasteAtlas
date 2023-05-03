//
//  ViewController.swift
//  TasteAtlas
//
//  Created by Asım Altınışık on 2.05.2023.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var exploreButton: UIButton!
    @IBOutlet weak var savedButton: UIButton!
    @IBOutlet weak var scannerButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var settingsButton: UIButton!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true // Show user location on the map

        // Set up the location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // Set the desired location accuracy
        locationManager.requestWhenInUseAuthorization() // Request permission to access location
        locationManager.startUpdatingLocation() // Start updating the user's location
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setLabels()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
    
    private func setLabels(){
        exploreButton.setTitle("", for: .normal)
        savedButton.setTitle("", for: .normal)
        scannerButton.setTitle("", for: .normal)
        settingsButton.setTitle("", for: .normal)
    }



}

