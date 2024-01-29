//
//  ContentView.swift
//  SwiftUI API Call
//
//  Created by Suresh Sindam on 1/28/24.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    HStack {
                        URLImage(urlString: course.image, data: nil)
                        Text(course.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                    }
                    .padding(2)
                }
                
            }
            .navigationTitle("Courses")
            .onAppear(perform: {
                viewModel.fetchData()
            })

        }
    }
}

#Preview {
    ContentView()
}
