//
//  URLImage.swift
//  SwiftUI API Call
//
//  Created by Suresh Sindam on 1/28/24.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .CustomImageModifier()
        } else {
            Image(systemName: "video")
                .CustomImageModifier()
                .onAppear(perform: {
                    fetchImgData()
                })
        }
    }
    
    func fetchImgData() {
        guard let url = URL(string: urlString) else {
            print("invalid image url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Invalid response", error ?? "error msg is empty")
                return
            }
            
            self.data = data
        
        }.resume()
    }
}

#Preview {
    URLImage(urlString: "")
}
