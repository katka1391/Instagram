//
//  LoginView.swift
//  Instagram
//
//  Created by katka.slivova on 31/01/2023.
//

import SwiftUI
import Foundation
import Firebase

struct LoginView: View {
    let fontCustom = Font.custom("vinyl_bold", size: 25)
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack {
                    Image("instagram-title")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                    VStack (spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        CustomPasswordField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }.padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot password").font(.system(size: 14, weight: .semibold)).foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        })
                    }
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In").font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color(.systemPurple))
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView().navigationBarHidden(true), label: {
                           HStack {
                               Text("Don't have an account?").font(.system(size: 14))
                               Text("Sign Up").font(.system(size: 15, weight: .semibold))
                           }.foregroundColor(.white)
                            .padding(.bottom)
                       })
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
