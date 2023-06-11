//
//  SignUpPage.swift
//  SAR
//
//  Created by Mohammed on 20/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct SignUpPage: View {
    
    var body: some View {
        ZStack{
            Image("BG2")
                .resizable()
                .ignoresSafeArea()
            Text("Create Accont")
                .bold()
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.bottom , 500)
            ScrollView {
                VStack{

                    ExtractedView()
                    
                }
            }.padding(.top , 250)
            
        }
    }
    }

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}

struct ExtractedView: View {
    @State var email = ""
    @State var fullName = ""
    @State var phone = ""
    @State var dateOfBirth = Date.now
    @State var password = ""
    var body: some View {
        Text("Email *")
            .padding(.trailing , 280)
        TextField("", text: $email)
            .keyboardType(.emailAddress)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 0.8)
            )
            .padding(.bottom, 10)
            .padding()
        Text("Full Name *")
            .padding(.trailing , 260)
        TextField("", text: $fullName)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 0.8)
            )
            .padding(.bottom, 10)
            .padding()
        Text("Mobile *")
            .padding(.trailing , 280)
        TextField("", text: $phone)
            .keyboardType(.phonePad)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 0.8)
            )
            .padding(.bottom, 10)
            .padding()
        Text("Date of birth *")
            .padding(.trailing , 240)
        DatePicker(selection: $dateOfBirth, in: ...Date.now, displayedComponents: .date) {
                       
            Text("Date is \(dateOfBirth.formatted(date: .long, time: .omitted))")
                   }
            .keyboardType(.emailAddress)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 0.8)
            )
            .padding(.bottom, 10)
            .padding()
        VStack{
            Text("password *")
                .padding(.trailing , 260)
            SecureField("", text: $password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 0.8)
                )
                .padding(.bottom, 10)
                .padding()
        }
        Button(action: {
            signUp()
        }) {
            Text("Register ")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color("Color"))
                .cornerRadius(10)
        }
        .padding()
    }
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password){ re , errors in
            if errors != nil{
                print(errors!.localizedDescription )
            } else {
                print(re!.description)
            }
        }
    }

}
