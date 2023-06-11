//
//  TripeDetails.swift
//  SAR
//
//  Created by Mohammed on 21/11/1444 AH.
//

import SwiftUI

struct TripeDetails: View {
    @StateObject var vm = InfoViewModel()
    @State var info : PassengerInfo
    
    var body: some View {
        ZStack {
            Image("BG2")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack{
                    HStack{
                        Text(info.fromCity)
                        Image(systemName: "arrowshape.right.fill")
                            .foregroundColor(Color("Color"))
                        Text(info.toCity)
                        Image(systemName: "person.3.sequence.fill")
                        Text("\(info.passenger) passengers")
                    }.padding()
                    
                    Text("Tripe Date")
                        .padding(.trailing , 240)
                    Text(DateFormatter.localizedString(from: info.goDate, dateStyle: .short, timeStyle: .none))
                        .padding(.trailing, 21)
                        .padding(.trailing , 210)
                    
                    
                    Text("Journey Details")
                        .padding()
                   
                    HStack{
                        Text("Outbound")
                            .bold()
                            .foregroundColor(Color("Color"))
                        Spacer()
                        Text("Train No.1")
                            .bold()
                            .foregroundColor(Color("Color"))
                    }.padding()
                    
                    
                    HStack{
                        VStack{
                            Text("5:10")
                            Text(info.fromCity)
                        }
                        Image("row")
                            .resizable()
                            .frame(width: 220 , height: 40)
                        Spacer()
                        VStack{
                            Text("8:45")
                            Text(info.toCity)
                        }
                    }.padding()
                    
                    Divider()
                    HStack{
                        VStack {
                            Text("Tiket price")
                            Text("Totale price")
                        }
                        Spacer()
                        VStack{
                            Text("\(String(format: "%.2f", info.price )) SAR")
                            Text("\(String(format: "%.2f", info.price * Double(self.info.passenger))) SAR")
                        }
                        
                        
                    }.padding()
                    Button {
                      
                        
                    }
                    label: {
                        Text("Done")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: 300)
                            .background(Color("Color"))
                            .cornerRadius(10)
                    }.padding()
                }
            }.padding(.top , 260)
        }
    }
}

