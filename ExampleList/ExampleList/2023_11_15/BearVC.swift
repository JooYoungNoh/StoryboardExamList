//
//  BearVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/15.
//

import UIKit
import Combine

class BearVC: UIViewController {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "텍스트 입력하셈"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        return textField
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
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
    
    var viewModel: BearVM = BearVM()
    var disposalbleBag = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        uiCreate()
    }
    
    @objc func buttonClick(_ sender: UIButton) {
        self.textField.text = ""
        let nextVC = BearTwoVC()
        nextVC.viewModel = self.viewModel
        self.navigationController?.pushViewController(nextVC, animated: true)
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
        
        self.nextButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        self.view.addSubview(self.nextButton)
        self.nextButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-30)
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(self.textField)
        self.textField.snp.makeConstraints { make in
            make.top.equalTo(self.nextButton.snp.top)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalTo(self.nextButton.snp.leading).offset(-10)
            make.bottom.equalTo(self.nextButton.snp.bottom)
        }
        
        //바인딩
        self.viewModel.$text.sink{ (updatedList: String) in
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

extension BearVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.viewModel.text += textField.text ?? ""
    }
}
