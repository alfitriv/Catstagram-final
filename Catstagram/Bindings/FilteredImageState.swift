//
//  FilteredImageState.swift
//  Catstagram
//
//  Created by Vania Radmila Alfitri on 22/11/20.
//

import Foundation
import UIKit

class FilteredImageState: ObservableObject {
    @Published var filteredImages: [UIImage] = []
    
    var CIFilterNames = [
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CISepiaTone"
    ]
    
    func filterImage(image: UIImage) {
        for filterName in CIFilterNames {
            let ciContext = CIContext(options: nil)
            let coreImage = CIImage(image: image)
            let filter = CIFilter(name: filterName)
            filter!.setDefaults()
            filter!.setValue(filterName, forKey: kCIInputImageKey)
            filter!.setValue(coreImage, forKey: kCIInputImageKey)
            let filteredImageData = filter!.value(forKey: kCIOutputImageKey) as! CIImage
            let filteredImageRef = ciContext.createCGImage(filteredImageData, from: filteredImageData.extent)
            let filteredImage = UIImage(cgImage: filteredImageRef!);
            
            filteredImages.append(filteredImage)
            
        }
    }
}
