//
//  AutoLayoutSixVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/13.
//

import UIKit
import SnapKit

class AutoLayoutSixVC: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fallGlass")
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let autoLabel: UILabel = {
        let label = UILabel()
        label.text = "auto머시기"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let tapMeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        uiCreate()
    }
    
    func uiCreate() {
        
        self.view.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        self.view.addSubview(self.autoLabel)
        self.autoLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        self.view.addSubview(self.tapMeButton)
        self.tapMeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
    }
}
