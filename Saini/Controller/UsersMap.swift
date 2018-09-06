//
//  UsersMap.swift
//  Saini
//
//  Created by Rohit Saini on 05/07/18.
//  Copyright © 2018 SainiSaab. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import FirebaseAuth
import MapKit

class UsersMap: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
    var UsersArr = [User]()
    var selectedUser: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackButton()
        self.fetchUsers()
        
        

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.endEditing(true)
       // mapView.mapStyle(withFilename: "mapStyle", andType: "json")
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Users"
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    //Downloads users list for Contacts View
    func fetchUsers()  {
        UsersArr.removeAll()
        if let id = Auth.auth().currentUser?.uid {
            User.downloadAllUsers(exceptID: id, completion: {(user) in
                DispatchQueue.main.async {
                    self.UsersArr.append(user)
//                    print("USER COUNT = \(self.UsersArr.count)")
//                    if self.UsersArr.count == 4{
//                        self.setUpLocation()
//                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            })
           
        }
       
    }
    
//    func setUpLocation() {
//        self.mapView?.isMyLocationEnabled = true
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.startUpdatingLocation()
//            //locationManager.startUpdatingHeading()
//        }
//    }//Setting up the Location Services
    
//    func determineMyCurrentLocation(){
//        //Your map initiation code
//        self.mapView?.isMyLocationEnabled = true
//
//        //Location Manager code to fetch current location
//        self.locationManager.delegate = self
//        self.locationManager.startUpdatingLocation()
//    }//Determine my current location
//
    //MARK:- Location Delegate Methods
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let location = locations.last
//
//        // Call stopUpdatingLocation() to stop listening for location updates,
//        // other wise this function will be called every time when user location changes.
//
//        // manager.stopUpdatingLocation()
//
//        print("user latitude = \((location?.coordinate.latitude)!)")
//        print("user longitude = \((location?.coordinate.longitude)!)")
//
//        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 1.0)
////        let position = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
////        let marker = GMSMarker(position: position)
////        marker.title = "My Location"
////        marker.map = mapView
//         self.mapView?.animate(to: camera)
////        self.mapView.mapType = .normal
//         var tag = 0
//        for user in self.UsersArr{
//            let position = CLLocationCoordinate2D(latitude: (user.latitude as! CLLocationDegrees), longitude: (user.longitude as! CLLocationDegrees))
//            let marker = GMSMarker(position: position)
//            marker.title = user.name
//            let iconImage = UIImageView()
//            iconImage.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//            iconImage.circleImage()
//            iconImage.applyBorder(width: 1, borderColor: UIColor.black)
//            iconImage.image = user.profilePic
//            marker.iconView = iconImage
//            marker.snippet = String(tag)
//            marker.map = mapView
//            tag = tag + 1
//        }
//        //Finally stop updating location otherwise it will come again and again in this delegate
//        self.locationManager.stopUpdatingLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Error \(error)")
//    }//Error in location Fetching
//
//    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        mapView.animate(toLocation: marker.position)
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let Chat = storyBoard.instantiateViewController(withIdentifier: "Chat") as! Chat
//        if let tag = Int(marker.snippet!){
//             selectedUser = self.UsersArr[tag]
//        }
//        Chat.currentUser = selectedUser
//        self.navigationController?.pushViewController(Chat, animated: true)
////        if let infoWindow = Bundle.main.loadNibNamed("MarkerView", owner: self, options: nil)?.first as? MarkerView{
////            infoWindow.frame = CGRect(x: 100, y: 100, width: 220, height: 250)
////            if let tag = Int(marker.snippet!){
////                infoWindow.name.text = self.UsersArr[tag].name
////                infoWindow.profilePic.image = self.UsersArr[tag].profilePic
////            }
////            let gesture = UITapGestureRecognizer(target: self, action: #selector(moveToConversation))
////            infoWindow.chatBtn.isUserInteractionEnabled = true
////            infoWindow.chatBtn.addGestureRecognizer(gesture)
////            self.mapView.addSubview(infoWindow)
//        //}
//
//
//        return true
//    }//tap on Marker
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UsersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TotalUserCell", for: indexPath) as? TotalUserCell else {
            return UITableViewCell()
        }
        cell.profilePic.image = UsersArr[indexPath.row].profilePic
        cell.username.text = UsersArr[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let Chat = storyBoard.instantiateViewController(withIdentifier: "Chat") as! Chat
        Chat.currentUser = self.UsersArr[indexPath.row]
        self.navigationController?.pushViewController(Chat, animated: true)
    }
    
    
//
//    //MARK:- Move to Conversational Controller
//    @objc func moveToConversation(){
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let Conversations = storyBoard.instantiateViewController(withIdentifier: "Conversations") as! Conversations
//        self.navigationController?.pushViewController(Conversations, animated: true)
//    }
    
    @IBAction func showChatBtnPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let Conversations = storyBoard.instantiateViewController(withIdentifier: "Conversations") as! Conversations
        self.navigationController?.pushViewController(Conversations, animated: true)
        
    }

}

//
//extension GMSMapView {
//    func mapStyle(withFilename name: String, andType type: String) {
//        do {
//            if let styleURL = Bundle.main.url(forResource: name, withExtension: type) {
//                self.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
//            } else {
//                NSLog("Unable to find style.json")
//            }
//        } catch {
//            NSLog("One or more of the map styles failed to load. \(error)")
//        }
//    }
//}
