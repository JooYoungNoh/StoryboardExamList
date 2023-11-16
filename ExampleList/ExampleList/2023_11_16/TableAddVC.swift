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

    override func viewDidLoad() {
        super.viewDidLoad()
        uiCreate()
    }
}

//MARK: 탭 제스처
extension TableAddVC {
    func uiCreate() {
        uiTapCreate()
        
        self.selectImageView.layer.cornerRadius = 20
        self.selectImageView.image = UIImage(named: "selectImage")
        
        self.addButton.layer.cornerRadius = 10
        
        self.nameTextField.layer.cornerRadius = 10
        self.nameTextField.layer.borderWidth = 1
        self.nameTextField.layer.borderColor = UIColor.systemGray4.cgColor
        
        self.addressTextField.layer.cornerRadius = 10
        self.addressTextField.layer.borderWidth = 1
        self.addressTextField.layer.borderColor = UIColor.systemGray4.cgColor
    }
}

extension TableAddVC {
    @objc func backView(_ sender: Any){
        self.dismiss(animated: true)
    }
    
    //
    @objc func touchView(_ sender: Any){
        
    }
    
    func uiTapCreate() {
        //탭 제스처
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backView(_:)))
        view.addGestureRecognizer(tapGesture)
        
        let alertTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchView(_:)))
        self.alertView.addGestureRecognizer(alertTapGesture)
    }
}
