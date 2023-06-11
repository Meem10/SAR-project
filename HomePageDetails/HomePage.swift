//
//  HomePage.swift
//  SAR
//
//  Created by Mohammed on 20/11/1444 AH.
//

import SwiftUI
import FirebaseFirestore

struct HomePage: View {
    @State private var number: Int = 1
    @State var goDate = Date.now
    @State var backDate = Date.now
    @State private var                         showingAlert = false
    @State private var showDatePicker = false
    @State private var showGreeting = true
    var city = ["Dammam", "Riyadh", "Hufuf", "Abqaiq"]
    @State private var Picker1 = ""
    @State private var Picker2 = ""
    @State private var price : Double = 40
    @State private var selected: PassengerInfo?
    @StateObject var vm = InfoViewModel()
    @State private var tripe = 1
     var info : [PassengerInfo] = []
    var body: some View {
        NavigationView {
            ZStack{
                Image("BG2")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    HStack(spacing: 2){
                        VStack {
                            Text("From")
                                .bold()
                            Picker("", selection: $Picker1) {
                                Text("").tag("")
                                ForEach(city, id: \.self) {
                                    Text($0).tag(0)
                                    
                                }
                            }
                            .accentColor(.gray)
                            Text("\(Picker1)")
                            
                        } .frame(width: 180, height: 120)
                            .background(Color.cyan.opacity(0.3))
                            .cornerRadius(10)
                        
                        VStack {
                            Text("To")
                                .bold()
                            Picker("", selection: $Picker2) {
                                Text("").tag("")
                                ForEach(city, id: \.self) {
                                    Text($0).tag(0)
                                }
                            }
                            .accentColor(.gray)
                            Text("\(Picker2)")
                        }
                        .frame(width: 180, height: 120)
                        .background(Color.cyan.opacity(0.3))
                        .cornerRadius(10)
                    }
                        .padding()
                    HStack{
                        
                        VStack{
                            Text("Outbound")
                                .foregroundColor(Color("Color"))
                                .bold()
                            DatePicker(selection: $backDate, in: ...Date.now, displayedComponents: .date) {
                            }
                        }.padding()
                            .accentColor(Color("Color"))
                        
                        VStack{
                            Text("Round Trip")
                                .font(.system(size: 11))
                            Toggle("", isOn: $showGreeting)
                                .toggleStyle(SwitchToggleStyle(tint: Color("Color")))
                            
                        }.padding()
                        
                        
                        VStack{
                            Text("return")
                                .foregroundColor(Color("Color"))
                                .bold()
                            DatePicker(selection: $goDate, in: ...Date.now, displayedComponents: .date) {
                                
                                
                            }
                        }.padding()
                            .accentColor(Color("Color"))
                    }
                        .padding()
                    HStack {
                        Text("Passengere ")
                            .foregroundColor(Color("Color"))
                            .bold()
                        Picker("Your age", selection: $number) {
                            ForEach(1...15, id: \.self) { number in
                                Text("\(number)")
                            }
                        }.accentColor(Color("Color"))
                    }
                    .padding()
                    .background(Color.cyan.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    .padding()
                    
                    Button {
                        vm.readpassenger(goDate: goDate, backDate: backDate, fromCity: Picker1, toCity: Picker2, passenger: number, price: price)
                        showingAlert = true
                        addToDataBase(goDateDB: self.goDate, backDateDB: self.backDate, fromCityDB: self.Picker1, toCityDB: self.Picker2, passengerDB: self.number, priceDB: self.price)
                        self.tripe += 1
                        
                    }
                    label: {
                        Text("Cheake Out")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: 300)
                            .background(Color("Color"))
                            .cornerRadius(10)
                    }.alert("Are you sure about the tripe information?", isPresented: $showingAlert) {
                        Button("Yes", role: .destructive) { }
                        Button("Cancel", role: .cancel) { }
                    }
                }
                .padding(.top , 200)
            }
        }
    }
    

    func addToDataBase(goDateDB: Date , backDateDB: Date ,fromCityDB: String,  toCityDB: String ,passengerDB: Int , priceDB: Double ){
        let dataBase = Firestore.firestore()
        
        dataBase.collection("users").document("tripe\(tripe)").setData([
            "go date "   : goDateDB,
            "back date " : backDateDB,
            "from City " : fromCityDB,
            "to City "   : toCityDB,
            "passenger " : passengerDB,
            "price "     : priceDB,
        ])
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


