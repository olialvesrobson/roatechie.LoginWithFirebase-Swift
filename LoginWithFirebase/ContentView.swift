//
//  ContentView.swift
//  LoginWithFirebase
//
//  Created by Robson Oliveira Alves on 5/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var fieldColor = Color(red: 255/255, green: 255/255, blue: 255/255,opacity: 0.8)
    
    var body: some View {
        
        ZStack{
            backgroundImage()
            VStack  {
                
                welcomeText()
                Spacer()
                Spacer()
                
                TextField("Username", text: $email)
                    .padding()
                    .background(fieldColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(fieldColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Spacer()
                Button(action: {
                    print("User \($email) is logged!")
                }) {
                    Text("Sign in")
                        .font(.largeTitle)
                }.padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(25)
                
                Button(action: {}
                ) {
                    Text("Sign Up here")
                }.padding()
                
                Spacer()
                Text("powered by Roatechie - Robson")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct backgroundImage: View {
    var body: some View{
        return Image("image2").resizable().frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct welcomeText: View {
    var body: some View {
        return Text("Welcome!").font(.largeTitle).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

