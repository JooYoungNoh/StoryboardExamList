//
//  UIKitAndSwiftUIVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/20.
//

import UIKit
import SwiftUI
import SnapKit

class UIKitAndSwiftUIVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.uiCreate()
    }
    
    func uiCreate() {
        self.navigationController?.navigationBar.isHidden = true
        
        let swiftUIVC = UIHostingController(rootView: GridRowView())
        
        self.addChild(swiftUIVC)
        self.view.addSubview(swiftUIVC.view)
        
        swiftUIVC.view.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
