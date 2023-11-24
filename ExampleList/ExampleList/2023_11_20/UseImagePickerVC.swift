//
//  UseImagePickerVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/24.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import AVKit
import AVFoundation

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
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true)
            
            self.newMeida = false
        }
    }
    
    @objc func didFinishError(image: UIImage, didFinishError error: NSErrorPointer, centextInfo: UnsafeRawPointer) {
        if error != nil {
            
        } else {
            print(error.debugDescription.localizedLowercase)
        }
    }
}

extension UseImagePickerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //이미지 선택하면 호출될 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[.mediaType] as! NSString
        //let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        if mediaType.isEqual(to: UTType.image.identifier) {
            let img = info[.originalImage] as! UIImage
            
            self.imageView.image = img
            
            if newMeida {
                UIImageWriteToSavedPhotosAlbum(img, self, #selector(UseImagePickerVC.didFinishError(image:didFinishError:centextInfo:)), nil)
            }
        }
        //이미지 피커 컨트롤창 닫기
        picker.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! AVPlayerViewController
        
        let url = URL(string: "https://i.namu.wiki/i/f4Dnxg6yv0VUXjiV6fQZAdx5Ii62f3nxYu3jT-r8M-JfvbYmb5dROGQ9AzYW2g4Uf2DS1vf1tcxZP5n40acOiQ.mp4")
        
        if let movieURL = url {
            dest.player = AVPlayer(url: movieURL)
            dest.player?.play()
        }
    }
}
