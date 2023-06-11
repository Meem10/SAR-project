//
//  MyTabPar.swift
//  SAR
//
//  Created by Mohammed on 21/11/1444 AH.
//

import SwiftUI

struct MyTabPar: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AllTiketsPage()
                .tabItem {
                    Label("My Tikets", systemImage: "square.and.pencil")
                }
            
        }
    }
}
struct MyTabPar_Previews: PreviewProvider {
    static var previews: some View {
        MyTabPar()
    }
}
