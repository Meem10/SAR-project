//
//  ForgetPasswordPage.swift
//  SAR
//
//  Created by Mohammed on 22/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct ForgetPasswordPage: View {
    @State var email = ""
    @State private var showingAlert = false
    var body: some View {
        ZStack{
            Image("BG2")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image("forgotPassword")
                    .resizable()
                    .frame(width: 300,height: 300)
                HStack{
                    Text("Forgot Password?")
                        .font(.system(.title).bold())
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top,10)
                
                HStack{
                    Text("Don't worry just enter the email associated with your account and we'll send an email to reset your password")
                        .foregroundColor(Color.black)
                        .font(.system(.caption))
                    
                }
                .padding(.top,10)
                
                
                TextField("Enter your Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.cyan.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                    .padding()
                
                Button(action:{
                    forgotPassowrd(email: self.email)}
                 )
                {
                    Text("Send the link")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .alert("Great! Cheak your Email ", isPresented: $showingAlert) {
                            Button("Done", role: .cancel) {}}
                }
                .padding()
              
                
            }.padding()
        }
    }
    
    func forgotPassowrd(email:String){
        Auth.auth().sendPasswordReset(withEmail: email){error in
            if let error = error {
                print("the like was not sent!! \(error.localizedDescription)")
            } else {
                print("the link was sent!!!")
            }            
        }
        
        
        
        
    }
}

struct ForgetPasswordPage_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordPage()
    }
}



    
