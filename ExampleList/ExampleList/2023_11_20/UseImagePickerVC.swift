//
//  UseImagePickerVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/24.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class UseImagePickerVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var newMeida: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension UseImagePickerVC {
    @IBAction func useCamera(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true)
            
            self.newMeida = true
        }
    }
    
    @IBAction func useCameraRoll(_ sender: UIBarButtonItem) {
        
    }
}

extension UseImagePickerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
