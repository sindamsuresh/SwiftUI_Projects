//
//  Extension + Image.swift
//  SwiftUI API Call
//
//  Created by Suresh Sindam on 1/28/24.
//

import SwiftUI


extension Image {
    func CustomImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 70)
            .cornerRadius(8)
    }
}


// just for reference why not custom ViewModifier image
// there is an issue with .resizable() for the content

//struct ImageModifier: ViewModifier {
//        func body(content: Content) -> some View {
//            content
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 70)
//                .background(Color.red)
//                .cornerRadius(6)
//        }
//    }


