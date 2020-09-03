//
//  Service.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//
//
//  Services.swift
//  fastOrder
//
//  Created by Domagoj Beronic on 28/07/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore


class Services {
    private let database = Database.database().reference()
    private let databaseFirestore = Firestore.firestore()
    var orders: [Order] = []
    var orderedBeverages: [Beverage] = []
    
    func postOrderIntoFirebase(order: Order) {
        let uuid = UUID().uuidString
        let orderPostedInFirebase: [String: Any] = [
            "id": "Order\(uuid)",
            "tableNumber": "999" as NSObject,
            "orderedBeveragesSum": String(order.beveragesCounter),
            "orderedBeveragesPriceSum": String(order.beveragesPriceSum),
        ]
        database.child("Orders").child("Order\(uuid)").setValue(orderPostedInFirebase)
        appendBeveragesDetailsOnOrderInFirebase(order: order, uuid: uuid)
    }
    
    func appendBeveragesDetailsOnOrderInFirebase(order: Order, uuid: String) {
        var counter = 0
        for beverage in order.beverages {
            let beverageInformationsPostedInFirebase: [String: Any] = [
                "name": beverage.name,
                "imageString": beverage.imageString,
                "price": beverage.price,
                "orderedBeverageCounter": beverage.beverageCounter
            ]
            counter += 1
            database.child("Orders").child("Order\(uuid)").child("Beverage\(counter)").setValue(beverageInformationsPostedInFirebase)
        }
    }
    
    //Loads and observes user orders stored in Firebase
    func getAndObserveFirebaseOrders(completion: @escaping([Order]) -> ()) {
        Database.database().reference().child("Orders").observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String:Any] {
                guard let orderId = (dictionary["id"] as? NSString) else {
                    return
                }
                guard let orderedBeveragesSum = (dictionary["orderedBeveragesSum"] as? NSString) else {
                    return
                }
                guard let orderedBeveragesPriceSum = (dictionary["orderedBeveragesPriceSum"] as? NSString) else {
                    return
                }
                guard let tableNumber = (dictionary["tableNumber"] as? NSString) else {
                    return
                }
                
                self.getDetailsOfEachBeverageInOrderAndAppendIt(snapshot: snapshot)
                
                self.appendOrdersFromFirebaseToOrders(orderId: orderId, orderedBeveragesSum: orderedBeveragesSum, orderedBeveragesPriceSum: orderedBeveragesPriceSum, tableNumber: tableNumber, orderedBeverages: self.orderedBeverages)
            }
            completion(self.orders)
        }
    }
    
    //Called for each order. Gets details of each beverage in order
    func getDetailsOfEachBeverageInOrderAndAppendIt(snapshot: DataSnapshot){
        for rest in snapshot.children.allObjects as! [DataSnapshot] {
            if let orderedBeverageDetailsDictionary = rest.value as? [String:Any] {
                guard  let imageString = orderedBeverageDetailsDictionary["imageString"] else {
                    return
                }
                guard let name = orderedBeverageDetailsDictionary["name"] else {
                    return
                }
                guard let price = orderedBeverageDetailsDictionary["price"] else {
                    return
                }
                guard let orderedBeverageCounter = orderedBeverageDetailsDictionary["orderedBeverageCounter"] else {
                    return
                }
                let beverage = Beverage(name: name as! String, imageString: imageString as! String, price: price as! Int, beverageCounter: orderedBeverageCounter as! Int)
                self.orderedBeverages.append(beverage)
            }
        }
    }
    
    //Is called by getAndObserveFirebaseOrders
    //Casts data collected by "getAndObserveFirebaseOrders" and "getDetailsOfEachBeverageInOrderAndAppendIt"
    //and appends it to variable orders
    func appendOrdersFromFirebaseToOrders(orderId: NSString, orderedBeveragesSum: NSString, orderedBeveragesPriceSum: NSString, tableNumber: NSString, orderedBeverages: [Beverage]) {
        let orderedBeveragesSumCasted = Int(orderedBeveragesSum as String)
        let orderedBeveragesPriceSumCasted = Int(orderedBeveragesPriceSum as String)
        let tableNumberCasted = Int(tableNumber as String)
        
        let orderFromFirebase = Order(id: orderId as String, tableNumber: tableNumberCasted!, orderedBeveragesSum: orderedBeveragesSumCasted!, orderedBeveragesPriceSum: orderedBeveragesPriceSumCasted!, beverages: self.orderedBeverages)
        self.orders.append(orderFromFirebase)
        self.orderedBeverages = []
    }
    
    func removeOrderFromFirebase(orderId: String){
        Database.database().reference().child("Orders").child(orderId).removeValue()
    }
    
    func sendWaiterRequestToFirestore(tableNumber: String){
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        let dateString = df.string(from: date)
        databaseFirestore.collection("LaBodega").document("WaiterRequests").setData(["tableNumber":tableNumber, "timeStamp":dateString])
    }
}


