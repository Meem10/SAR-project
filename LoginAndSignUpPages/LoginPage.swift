//
//  LoginPage.swift
//  SAR
//
//  Created by Mohammed on 20/11/1444 AH.
//

import SwiftUI
import FirebaseAuth


struct LoginPage: View {
    @State var email = ""
    @State var password = ""
    @State var showingAlert = false
    var body: some View {
        if showingAlert == true{
            MyTabPar()
        } else {
            NavigationView {
                ZStack{
                    Image("BG")
                        .resizable()
                        .ignoresSafeArea()
                    VStack{
                        
                        Text("Email")
                            .padding(.trailing , 300)
                        TextField("", text: $email)
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color.cyan.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                            .padding()
                        Text("Password")
                            .padding(.trailing , 300)
                        SecureField("", text: $password)
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color.cyan.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                            .padding()
                        
                        Button(action: {
                            signIn()
                        }) {
                            Text("Sign in ")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color("Color"))
                                .cornerRadius(10)
                        }
                        .padding()
                        NavigationLink {
                           SignUpPage()
                        } label: {
                            Text("Sign up now")
                                .bold()
                                .foregroundColor(Color("Color"))
                        }.padding()
                        NavigationLink {
                           ForgetPasswordPage()
                        } label: {
                            Text("Forget Password ? ")
                                .bold()
                                .foregroundColor(Color("Color"))
                        }

                        
                        
                        
                    }
                    
                    .padding(.top , 180 )
                    
                }
            }
        }
        
        
        
    }
    func signIn(){
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
                //showingAlert = true
            } else {
                print("Done!!!")
                showingAlert = true
            }
        }
    }

}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

