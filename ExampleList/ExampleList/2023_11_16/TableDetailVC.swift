//
//  TableDetailVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/16.
//

import UIKit
import WebKit

class TableDetailVC: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var webSite: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiCreate()
    }
    
    func uiCreate() {
        if let address = webSite, let webURL = URL(string: address) {
            let urlRequest = URLRequest(url: webURL)
            self.webView.load(urlRequest)
        }
    }
}
