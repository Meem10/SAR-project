////
////  ChoseTripe.swift
////  SAR
////
////  Created by Mohammed on 20/11/1444 AH.
////
//
//import SwiftUI
//
//
//struct ChoseTripe: View {
//    var city = ["Dammam", "Riyadh", "Hufuf", "Abqaiq"]
//    @State private var Picker1 = ""
//    @State private var Picker2 = ""
//    var body: some View {
//        HStack(spacing: 2){
//            VStack {
//                Text("From")
//                    .bold()
//                Picker("", selection: $Picker1) {
//                    Text("").tag("")
//                    ForEach(city, id: \.self) {
//                        Text($0).tag(0)
//                        
//                    }
//                }
//                .accentColor(.gray)
//                Text("\(Picker1)")
//                
//            } .frame(width: 180, height: 120)
//                .background(Color.cyan.opacity(0.3))
//                .cornerRadius(10)
//            
//            VStack {
//                Text("To")
//                    .bold()
//                Picker("", selection: $Picker2) {
//                    Text("").tag("")
//                    ForEach(city, id: \.self) {
//                        Text($0).tag(0)
//                    }
//                }
//                .accentColor(.gray)
//                Text("\(Picker2)")
//            }
//            .frame(width: 180, height: 120)
//            .background(Color.cyan.opacity(0.3))
//            .cornerRadius(10)
//            
//            
//            
//            
//        }
//    }
//}
//
//struct ChoseTripe_Previews: PreviewProvider {
//    static var previews: some View {
//        ChoseTripe()
//    }
//}
