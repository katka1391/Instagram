//
//  ImageUploader.swift
//  Instagram
//
//  Created by katka.slivova on 01/02/2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseCore
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Failed to upload image")
                return
            }
            
            print("Successfully uploaded images")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
                
            }
        }
    }
}
