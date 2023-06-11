//
//  Model.swift
//  SAR
//
//  Created by Mohammed on 20/11/1444 AH.
//

import Foundation



struct PassengerInfo : Identifiable{
    var id = UUID()
    var goDate : Date
    var backDate : Date
    var fromCity : String
    var toCity : String
    var passenger : Int
    var price : Double
}

