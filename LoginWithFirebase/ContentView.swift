//
//  ContentView.swift
//  LoginWithFirebase
//
//  Created by Robson Oliveira Alves on 5/11/20.
//

import SwiftUI
import Firebase

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
                    .frame(width: 250, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: $password)
                    .padding()
                    .background(fieldColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .frame(width: 250, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
                
                Button(action: {

                    if isUserLoggedIn() {
                      // Show logout page
                        signout()
                    } else {
                      // Show login page
                        signin(email: email, password: password)
                    }
                    
                    
                }) {
                    if isUserLoggedIn() {
                      // Show logout page
                        Text( "Sign Out" )
                                .font(.largeTitle)
                    } else {
                      // Show login page
                        Text( "Sign In" )
                                .font(.largeTitle)
                    }
                    
                    
                    
                }.padding()
                .foregroundColor(.white)
                .background(bkgColor ())
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

func isUserLoggedIn() -> Bool {
  return Auth.auth().currentUser != nil
}

func signin (email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
        if let error = error as NSError? {
        switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed:
              // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
                print("operationNotAllowed ", error.code)
            case .userDisabled:
              // Error: The user account has been disabled by an administrator.
                print("userDisabled ", error.code)
            case .wrongPassword:
              // Error: The password is invalid or the user does not have a password.
                print("wrongPassword ", error.code)
            case .invalidEmail:
              // Error: Indicates the email address is malformed.
                print("invalidEmail ", error.code)
            default:
                print("Error: \(error.localizedDescription)")
        }
      } else {
        print("User signs in successfully")
        let userInfo = Auth.auth().currentUser
        print(userInfo?.displayName ?? "")
      }
    }
}

func bkgColor () -> Color {
    if (isUserLoggedIn() ) {
        return Color.red
    } else {
        return Color.blue
    }
}
func signout () {
    do {
      try Auth.auth().signOut()
    } catch {
      print("Sign out error")
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

