////
////  UploadPostView.swift
////  Instagram
////
////  Created by katka.slivova on 26/01/2023.
////
//
//import SwiftUI
//import PhotosUI
//
//struct UploadPostView: View {
//    @State private var selectedImage: UIImage?
//    @State var postImage: Image?
//    @State var captionText = ""
//    @State private var selectedItem: PhotosPickerItem? {
//        didSet {
//            if let selectedItem {
//                let progress = loadTransferable(from: selectedItem)
//                imageState = .loading(progress)
//            } else {
//                imageState = .empty
//            }
//        }
//    }
//    @State private var selectedImageData: Data? = nil
//    
//    var body: some View {
//        
//        func loadTransferable(from selectedItem: PhotosPickerItem) -> Progress {
//            return selectedItem.loadTransferable(type: Image.self) { result in
//                DispatchQueue.main.async {
//                    guard selectedItem == self.selectedItem else { return }
//                    switch result {
//                    case .success(let image?):
//                        self.imageState = .success(image)
//                    case .success(nil):
//                        self.imageState = .empty
//                    case .failure(let error):
//                        self.imageState = .failure(error)                    }
//                }
//            }
//        }
//        
//        PhotosPicker (selection: $selectedItem,
//                      matching: .images,
//                      photoLibrary: .shared()) {
//            Text("Select a photo")
//        }
//        .onChange(of: selectedItem) { newItem in
//            Task {
//                // Retrive selected asset in the form of Data
//                if let data = try? await newItem?.loadTransferable(type: Data.self) {
//                    selectedImageData = data
//                }
//            }
//        }
//        
//        if let selectedImageData,
//           let uiImage = UIImage(data: selectedImageData) {
//            Image(uiImage: uiImage)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 50, height: 50)
//        }
//        
//     
//        
//        
//        
////        VStack {
////            if postImage == nil {
////                Button(action: {
////
////                }, label: {
////                    Image(systemName: "plus.circle")
////                        .resizable()
////                    //  .renderingMode(.template)
////                        .scaledToFill()
////                        .frame(width: 180, height: 180)
////                        .clipped()
////                        .foregroundColor(.black)
////                })
////            } else {
////                HStack(alignment: .top) {
////                    Image("katka")
////                        .resizable()
////                        .scaledToFill()
////                        .frame(width: 96, height: 96)
////                        .clipped()
////                        .padding(16)
////                    TextField("Enter your caption ..", text: $captionText).padding(.top)
////                }
////                Button(action: {
////
////                }, label: {
////                    Text("Share").font(.system(size: 18, weight: .semibold))
////                        .frame(width: 360, height: 50)
////                        .background(Color.blue)
////                        .cornerRadius(5)
////                        .foregroundColor(.white)
////                }).padding(.top, 96)
////                Spacer()
////            }
////        }
//    }
//}
//
//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
