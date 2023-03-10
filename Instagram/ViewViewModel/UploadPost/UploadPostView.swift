//
//  UploadPostView.swift
//  Instagram
//
//  Created by katka.slivova on 26/01/2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()

    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .font(Font.title.weight(.light))
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .foregroundColor(.black)
                }).sheet(isPresented: $imagePickerPresented, onDismiss:
                    loadImage,
                content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage {
                HStack(alignment: .top) {
                    VStack (spacing: 16) {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 96)
                            .clipped()
                        
                        Button(action: {
                            captionText = ""
                            postImage = nil
                        }, label: {
                            HStack (spacing: 8) {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                Text("Back")
                                    .font(.system(size: 15, weight: .semibold))
                            }
                        })
                    }
                   
                    TextArea(text: $captionText, placeholder: "Enter your caption..")
                        .frame(height: 200)
                }.padding()
                
                Button(action: {
                    if let image = selectedImage {
                        viewModel.uploadPost(caption: captionText, image: image) { _ in
                            captionText = ""
                            postImage = nil
                            tabIndex = 0
                        }
                    }
                }, label: {
                    Text("Share").font(.system(size: 18, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }).padding(.top, 32)
                Spacer()
            }
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

