//
//  ImagePicker.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 2/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseStorage

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isShow: Bool
    @Binding var imageURL: String
    var imageName = ""
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        let storage = Storage.storage().reference()
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let getfileName = info[.imageURL] as? URL else { return }
            print("File namee is \(getfileName.lastPathComponent) and type is \(type(of: getfileName.lastPathComponent))")
            //            imageName = String(describing: getfileName.lastPathComponent)
            let uiImage = info[.originalImage] as! UIImage
            uploadImageToFirebase(image: uiImage)
        }
        func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
        
        func uploadImageToFirebase(image: UIImage) {
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            let imgName = UUID().uuidString
            let imagePath = getDocumentsDirectory().appendingPathComponent(imgName)
            print(imgName)
            
            if let jpegData = image.jpegData(compressionQuality: 0.8) {
                print(jpegData)
                try? jpegData.write(to: imagePath)
                print(imagePath)
            }
            print(imagePath)
            
            storage.child(IMAGE_PROFILE_NAME).putData(image.jpegData(compressionQuality: 0.42)!, metadata: metadata) {
                (metadata, error) in
                guard  let metadata = metadata else {
                    print("put\(error?.localizedDescription)")
                    return
                }
                let size = metadata.size
                print("Upload size is \(size)")
                print("Upload success")
                
                self.dowloadImageFromFirebae()
            }
        }
        
        func dowloadImageFromFirebae() {
            
            storage.child(IMAGE_PROFILE_NAME).downloadURL { (url, error) in
                if error != nil {
                    print("dowload \(error?.localizedDescription)")
                    return
                }
                print("Dowload Success")
                self.parent.imageURL = "\(url!)"
                self.parent.isShow.toggle()
                
                self.listOfImageFire()
            }
        }
        
        func listOfImageFire() {
            let storageReference = Storage.storage().reference().child("image/")
            storageReference.listAll { (result, error) in
                if error != nil {
                    print("ref \(error?.localizedDescription)")
                    return
                }
                for prefix in result.prefixes {
                    print("prefix is \(prefix)")
                }
                for item in result.items {
                    print("items is \(item)")
                }
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        return
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
}
