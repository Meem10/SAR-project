////
////  DateTripe.swift
////  SAR
////
////  Created by Mohammed on 20/11/1444 AH.
////
//
//import SwiftUI
//
//struct DateTripe: View {
//    @State var goDate = Date.now
//    @State var backDate = Date.now
//    @State private var showDatePicker = false
//    @State private var showGreeting = true
//    @StateObject var vm = InfoViewModel()
//    var body: some View {
//        HStack{
//            
//            VStack{
//                Text("Outbound")
//                    .foregroundColor(Color("Color"))
//                    .bold()
//                DatePicker(selection: $backDate, in: ...Date.now, displayedComponents: .date) {
//                }
//            }.padding()
//                .accentColor(Color("Color"))
//            
//            VStack{
//                Text("Round Trip")
//                    .font(.system(size: 11))
//                Toggle("", isOn: $showGreeting)
//                    .toggleStyle(SwitchToggleStyle(tint: Color("Color")))
//                
//            }.padding()
//            
//            
//            VStack{
//                Text("return")
//                    .foregroundColor(Color("Color"))
//                    .bold()
//                DatePicker(selection: $goDate, in: ...Date.now, displayedComponents: .date) {
//                    
//                    
//                }
//            }.padding()
//                .accentColor(Color("Color"))
//        }
//    }
//}
//
//
//struct DateTripe_Previews: PreviewProvider {
//    static var previews: some View {
//        DateTripe()
//    }
//}
