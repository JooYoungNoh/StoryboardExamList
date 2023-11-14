//
//  AutoLayoutFiveVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/13.
//

import UIKit
import Combine
import SnapKit

class AutoLayoutFiveVC: UIViewController {
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let worldLabel: UILabel = {
        let label = UILabel()
        label.text = "World"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let twoHelloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let twoWorldLabel: UILabel = {
        let label = UILabel()
        label.text = "World"
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        uiCreate()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.redView.snp.removeConstraints()
        self.redView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalTo(self.view.snp.centerX)
            make.height.equalTo(size.height/3)
        }
        
        self.greenView.snp.removeConstraints()
        self.greenView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(self.view.snp.centerX)
            make.height.equalTo(size.height/3)
        }
    }
    
    func uiCreate() {
        self.view.addSubview(self.redView)
        self.redView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalTo(self.view.snp.centerX)
            make.height.equalTo(self.view.frame.height/3)
        }
        
        self.view.addSubview(self.greenView)
        self.greenView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(self.view.snp.centerX)
            make.height.equalTo(self.view.frame.height/3)
        }
        
        self.view.addSubview(twoHelloLabel)
        twoHelloLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        self.view.addSubview(twoWorldLabel)
        twoWorldLabel.snp.makeConstraints { make in
            make.top.equalTo(self.twoHelloLabel.snp.top)
            make.leading.equalTo(self.twoHelloLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        self.view.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        self.view.addSubview(worldLabel)
        worldLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(helloLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
    }
}

