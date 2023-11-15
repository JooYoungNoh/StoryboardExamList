//
//  TabPracticeVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/15.
//

import UIKit

class TabPracticeVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiCreate()
    }
    
    func uiCreate() {
        self.navigationItem.title = "탭 바 실험중"
        
        self.tabBar.backgroundColor = .systemGray6
        
        self.tabBar.items![0].title = "playstation"
        self.tabBar.items![0].image = UIImage(systemName: "playstation.logo")
        
        self.tabBar.items![1].title = "apple"
        self.tabBar.items![1].image = UIImage(systemName: "applelogo")

        self.tabBar.items![2].title = "logo"
        self.tabBar.items![2].image = UIImage(systemName: "logo.xbox")
    }
}
