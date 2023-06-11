//
//  AllTiketsPage.swift
//  SAR
//
//  Created by Mohammed on 21/11/1444 AH.
//

import SwiftUI
import FirebaseFirestore

struct AllTiketsPage: View {
    @StateObject var vm = InfoViewModel()
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    @State private var selectedRow: PassengerInfo?
    @State private var selectedRow2: PassengerInfo?
    @State private var tripe = 1
    let dataBase = Firestore.firestore()
    var body: some View {
        ZStack {
            Image("BG2")
                .resizable()
                .ignoresSafeArea()
            
            if vm.myInfo.isEmpty{
                Text("You don't have any tikets")
            } else {
                VStack{
                    List{
                        ForEach(vm.myInfo , id:\.id){ i in
                            HStack{
                                HStack{
                                    Text(i.fromCity)
                                    Image(systemName: "arrowshape.right.fill")
                                        .foregroundColor(Color("Color"))
                                    Text(i.toCity)
                                    
                                }.onTapGesture {
                                    selectedRow = i
                                    showingSheet = true
                                    print(i.fromCity)
                                }
                                Spacer()
                                HStack {
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .frame(width: 20 , height: 20)
                                        .foregroundColor(Color("Color"))
                                }.onTapGesture {
                                    selectedRow2 = i
                                    showingSheet2 = true
                                    
                                }

                            }
                        }.onDelete { indexSet in
                            indexSet.forEach { index in
                                dataBase.collection("users").document("tripe\(tripe)").delete() { error in
                                    if let error = error {
                                        print("Error deleting document: \(error)")
                                    } else {
                                        self.tripe += 1
                                        print("Document deleted successfully")
                                       
                                    }
                                }
                            }
                            vm.myInfo.remove(atOffsets: indexSet)
                        }
                        
                    }
                    .sheet(item: $selectedRow ){ toShow in
                        TripeDetails(info: toShow)
                    
                }
                    .sheet(item: $selectedRow2 ){ _ in
                        UpdateSheetPage()
                    
                }
                    
                    .scrollContentBackground(.hidden)
                     .padding(.top , 240)
                }
            }
            
        }
    }
}

struct AllTiketsPage_Previews: PreviewProvider {
    static var previews: some View {
        AllTiketsPage()
    }
}




