//
//  ViewModel.swift
//  SAR
//
//  Created by Mohammed on 20/11/1444 AH.
//

import Foundation
import FirebaseFirestore

@MainActor class InfoViewModel: ObservableObject {
    @Published var myInfo : [PassengerInfo] = []
    let dataBase = Firestore.firestore()
    
    init(){
        fetchDataBase()
    }

    func updateData(passengerInfo: PassengerInfo) {
        let documentReference = dataBase.collection("users").document(passengerInfo.id.uuidString)
        
        documentReference.updateData([
            "goDate": passengerInfo.goDate,
            "backDate": passengerInfo.backDate,
            "fromCity": passengerInfo.fromCity,
            "toCity": passengerInfo.toCity,
            "passenger": passengerInfo.passenger,
            "price": passengerInfo.price
        ]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document updated successfully")
            }
        }
    }

    
    func readpassenger(goDate: Date , backDate: Date ,fromCity: String , toCity: String , passenger: Int , price: Double  ){
        let info = PassengerInfo(goDate: goDate, backDate: backDate, fromCity: fromCity, toCity: toCity, passenger: passenger, price: price)
        myInfo.append(info)
    }

    
    func fetchDataBase() {
        dataBase.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    let goDate = data["go Date "] as? Date ?? Date()
                    let backDate = data["back Date "] as? Date ?? Date()
                    let fromCity = data["from City "] as? String ?? ""
                    let toCity = data["to City "] as? String ?? ""
                    let passenger = data["passenger "]
                    let price = data["price "]
                    let trips = PassengerInfo(
                        goDate: goDate,
                        backDate: backDate,
                        fromCity: fromCity,
                        toCity: toCity,
                        passenger: passenger as? Int ?? 0,
                        price: price as? Double ?? 0.0
                    )
                   
                    self.myInfo.append(trips)
                }
            }
        }
    }
    
    
}

