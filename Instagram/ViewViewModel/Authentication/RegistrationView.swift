//
//  RegistrationView.swift
//  Instagram
//
//  Created by katka.slivova on 31/01/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var username = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                        .clipShape(Circle())
                        .padding(32)
                } else {
                    Button(action: {
                        imagePickerPresented.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .font(Font.title.weight(.ultraLight))
                            .foregroundColor(.white)
                            .padding(32)
                    }).sheet(isPresented: $imagePickerPresented, onDismiss:
                                loadImage,
                            content: {
                                ImagePicker(image: $selectedImage)
                            })
                }
               
                VStack (spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
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
                
                Button(action: {
                    viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullName, username: username)
                }, label: {
                    Text("Sign Up").font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color(.systemPurple))
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Text("Alredy have an account?").font(.system(size: 14))
                        Text("Sign In").font(.system(size: 15, weight: .semibold))
                    }.foregroundColor(.white)
                        .padding(.bottom)
                })
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}
    
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
            RegistrationView()
    }
}
