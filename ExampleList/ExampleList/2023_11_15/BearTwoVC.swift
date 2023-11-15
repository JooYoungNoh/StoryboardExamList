//
//  BearTwoVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/15.
//

import UIKit
import Combine

class BearTwoVC: UIViewController {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "텍스트 입력하셈"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        return textField
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()
    
    let bringLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.layer.cornerRadius = 20
        return label
    }()
    
    var viewModel: BearVM?
    var disposalbleBag = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        uiCreate()
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonClick(_ sender: UIButton) {
        self.textField.text = ""
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: tap 제스쳐
    @objc func hideKeyboard(_ sender: Any){
        self.view.endEditing(true)
    }
    
    func uiCreate() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .systemBackground
        
        //탭 제스처
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
        
        self.backButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        self.view.addSubview(self.backButton)
        self.backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(30)
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(self.textField)
        self.textField.snp.makeConstraints { make in
            make.top.equalTo(self.backButton.snp.top)
            make.trailing.equalToSuperview().offset(-30)
            make.leading.equalTo(self.backButton.snp.trailing).offset(10)
            make.bottom.equalTo(self.backButton.snp.bottom)
        }
        
        //바인딩
        self.viewModel?.$text.sink{ (updatedList: String) in
            self.bringLabel.text = "\(updatedList)"
        }.store(in: &disposalbleBag)
        
        self.view.addSubview(self.bringLabel)
        self.bringLabel.snp.makeConstraints { make in
            make.top.equalTo(self.textField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
    }
}

extension BearTwoVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.viewModel?.text += textField.text ?? ""
    }
}
