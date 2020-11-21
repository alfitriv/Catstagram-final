//
//  ImageLoader.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 08/11/20.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {

     @Published var image: UIImage?
    
    func getImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                 return
            }
            
            guard let imageData = data, let image = UIImage(data: imageData) else {
                let error = NSError(domain: "", code: 404, userInfo: [:])
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(image))
                self.image = image
            }
        }.resume()
    }
}
