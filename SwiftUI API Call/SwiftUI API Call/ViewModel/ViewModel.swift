//
//  ViewModel.swift
//  SwiftUI API Call
//
//  Created by Suresh Sindam on 1/28/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var courses: [CourseModel] = []
    
    func fetchData() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            print("URL not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Invalid response", error ?? "error msg is empty")
                return
            }
            
            do {
                let courses = try JSONDecoder().decode([CourseModel].self, from: data)
                print(courses)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            } catch {
                print("error in data format conversion", error)
            }
        }.resume()
    }
}
