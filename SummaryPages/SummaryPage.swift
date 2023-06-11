//
//  SummaryPage.swift
//  SAR
//
//  Created by Mohammed on 20/11/1444 AH.
//

import SwiftUI

struct SummaryPage: View {
    @StateObject var vm = InfoViewModel()
    var body: some View {
        VStack{
            Text("Booking Summary")
                .padding()
            Divider()
            Text("Search Summary")
                .padding()
            ForEach(vm.myInfo , id: \.id){i in
                TripeDetails(info: i)
            }
           
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
    }
}

struct SummaryPage_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPage()
    }
}
