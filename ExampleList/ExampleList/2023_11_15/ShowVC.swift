//
//  ShowVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/15.
//

import UIKit

class ShowVC: UIViewController {
    
    let selectBearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go Bear", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        uiCreate()
    }
    
    @objc func goBear(_ sender: UIButton){
        guard let customTabBar = self.tabBarController as? CustomTabBar else { return }
        
        customTabBar.onClick(customTabBar.bearButton)
    }
    
    func uiCreate() {
        self.view.backgroundColor = .systemBackground
        
        self.selectBearButton.addTarget(self, action: #selector(goBear(_:)), for: .touchUpInside)
        self.view.addSubview(self.selectBearButton)
        self.selectBearButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
}
