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
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                        .padding(16)
                    TextField("Enter your caption ..", text: $captionText).padding(.top)
                }
                
                Button(action: {}, label: {
                    Text("Share").font(.system(size: 18, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }).padding(.top, 96)
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

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
