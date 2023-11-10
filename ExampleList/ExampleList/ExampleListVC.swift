//
//  ExampleListVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/10.
//

import UIKit

class ExampleListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Example List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
}

extension ExampleListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExampleListCell = tableView.dequeueReusableCell(withIdentifier: ExampleListCell.identifier, for: indexPath) as? ExampleListCell else { return UITableViewCell() }
        
        cell.titleLabel.text = "실험중"
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
}
