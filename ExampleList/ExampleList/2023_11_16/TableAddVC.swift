//
//  TableAddVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/16.
//

import UIKit

class TableAddVC: UIViewController {
    
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var selectImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var viewModel: TablePracticeVM?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        uiCreate()
    }
}

//MARK: 화면 설정
extension TableAddVC {
    func uiCreate() {
        uiTapCreate()
        
        self.alertView.layer.cornerRadius = 20
        
        self.selectImageView.layer.cornerRadius = 20
        self.selectImageView.image = UIImage(named: "selectImage")
        
        self.addButton.layer.cornerRadius = 10
        self.addButton.setTitleColor(.blue, for: .selected)
        
        self.nameTextField.layer.cornerRadius = 10
        self.nameTextField.layer.borderWidth = 1
        self.nameTextField.layer.borderColor = UIColor.systemGray4.cgColor
        
        self.addressTextField.layer.cornerRadius = 10
        self.addressTextField.layer.borderWidth = 1
        self.addressTextField.layer.borderColor = UIColor.systemGray4.cgColor
    }
}

//MARK: 버튼 메소드
extension TableAddVC {
    @IBAction func buttonClick(_ sender: UIButton) {
        if nameTextField.text != "" && addressTextField.text != "" && selectImageView.image != UIImage(named: "selectImage") {
            self.viewModel?.items.append(TablePracticeModel(attractionNames: nameTextField.text!, webAddresses: addressTextField.text!, image: selectImageView.image!))
            self.tableView?.reloadData()
        }
    }
}

//MARK: 탭 제스처
extension TableAddVC {
    @objc func backView(_ sender: Any){
        self.dismiss(animated: true)
    }
    
    //
    @objc func touchView(_ sender: Any){
        
    }
    
    @objc func touchImage(_ sender: UIImageView) {
        let alert2 = UIAlertController(title: "선택해주세요", message: nil, preferredStyle: .actionSheet)
        self.profileImageChange(alert2: alert2)
        
        self.present(alert2, animated: true)
    }
    
    func uiTapCreate() {
        //탭 제스처
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backView(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        let alertTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchView(_:)))
        self.alertView.addGestureRecognizer(alertTapGesture)
        
        let imageViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchImage(_:)))
        self.selectImageView.isUserInteractionEnabled = true
        self.selectImageView.addGestureRecognizer(imageViewTapGesture)
    }
}

//MARK: ImagePicker 메소드
extension TableAddVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 이미지를 가져올 장소(?) 카메라 앨범 등 선택 메소드
    func imgPicker(_ source: UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    
    //이미지 선택하면 호출될 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.selectImageView.image = img
        //이미지 피커 컨트롤창 닫기
        picker.dismiss(animated: true)
    }
    
    func profileImageChange(alert2: UIAlertController){
        //카메라를 사용할 수 있으면 (시뮬레이터 불가)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            alert2.addAction(UIAlertAction(title: "카메라", style: .default){(_) in
                self.imgPicker(.camera)
            })
        }
        //저장된 앨범을 사용할 수 있으면
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            alert2.addAction(UIAlertAction(title: "앨범", style: .default){(_) in
                self.imgPicker(.savedPhotosAlbum)
            })
        }
        //포토 라이브러리를 사용할 수 있으면
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            alert2.addAction(UIAlertAction(title: "포토 라이브러리", style: .default){(_) in
                self.imgPicker(.photoLibrary)
            })
        }
        //취소 버튼 추가
        alert2.addAction(UIAlertAction(title: "취소", style: .cancel))
    }
}
