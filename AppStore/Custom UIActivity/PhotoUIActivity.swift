//
//  PhotoUIActivity.swift
//  AppStore
//
//  Created by LeeHsss on 2022/02/20.
//

import UIKit
import Photos
import PhotosUI

protocol setImage {
    func set(image: UIImage)
}

class PhotoUIActivity: UIActivity {
    
    var delegate: setImage
    
    var viewController: UIViewController
    
    var image: UIImage
    
    init(_ viewController: UIViewController, delegate: setImage, image: UIImage) {
        self.viewController = viewController
        self.delegate = delegate
        self.image = image
    }
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override var activityType: UIActivity.ActivityType? {
        return .photoLibrary
    }
    
    override var activityImage: UIImage? {
        guard let imageURL = URL(string: "https://cdn.pixabay.com/photo/2015/01/08/18/24/children-593313_1280.jpg"),
        let data = try? Data(contentsOf: imageURL) else { return UIImage()}
                
        return UIImage(data: data)
    }
    
    override var activityTitle: String? {
        return "Photo"
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func perform() {
        // 수행하는 부분
        
        //MARK: 이미지를 가져와서 변경
        var configuration: PHPickerConfiguration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        let imagePicker = PHPickerViewController(configuration: configuration)
        imagePicker.delegate = self


        viewController.present(imagePicker, animated: true, completion: nil)
        
        
        //MARK: 이미지 앨범에 저장
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        activityDidFinish(true)
    }
    
    
    override func activityDidFinish(_ completed: Bool) {
        if completed {
            viewController.dismiss(animated: true, completion: nil)
        } else {
            print("Photo Library perform Not Completed")
        }
    }
}


extension UIActivity.ActivityType {
    public static let photoLibrary = UIActivity.ActivityType(rawValue: "Photo Library")
}

extension PhotoUIActivity: PHPickerViewControllerDelegate {
    //MARK: Required Method
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        let imageProvider = results.first?.itemProvider
        
        if let provider = imageProvider, provider.canLoadObject(ofClass: UIImage.self) {
            provider.loadObject(ofClass: UIImage.self) { (image: NSItemProviderReading?, error: Error?) in
                guard let image = image as? UIImage else { return }
               
                
                self.delegate.set(image: image)
            }
        }
    }
}
