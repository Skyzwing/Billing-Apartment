//
//  PhotoCaptureView.swift
//  Billing Apartment
//
//  Created by Surachat Yaitammasan on 2/5/2563 BE.
//  Copyright © 2563 Surachat Yaitammasan. All rights reserved.
//

import SwiftUI
import FirebaseStorage
import Combine

struct PhotoCaptureView: View {
    
    @ObservedObject var imageLoader: DataLoader
    
    @State var image: UIImage = UIImage()
    
    init(imageURL: String) {
        imageLoader = DataLoader(urlString: imageURL)
    }
//    @Binding var isImagePicker: Bool
//    @Binding var image: Image?
    
    var body: some View {
        VStack {
            Image(uiImage: image).resizable().frame(width: 125, height: 125).clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 2)).padding(.bottom, 21)
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

class DataLoader: ObservableObject {
    
    @Published var didChange = PassthroughSubject<Data, Never>()
    @Published var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString: String) {
        getDataFromURL(urlString: urlString)
    }
    
    func getDataFromURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}

//struct PhotoCaptureView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoCaptureView(isImagePicker: .constant(true), image: .constant(Image(systemName: "phone.fill")))
//    }
//}
