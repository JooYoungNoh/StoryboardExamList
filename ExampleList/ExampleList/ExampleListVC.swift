//
//  ExampleListVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/10.
//

import UIKit

class ExampleListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var examList: [String] = ["InteractionExamVC", "AutoLayoutOneVC", "AutoLayoutTwoVC", "AutoLayoutThreeVC", "AutoLayoutFourVC", "AutoLayoutFiveVC", "AutoLayoutSixVC", "CrossVC", "EventVC", "TabPracticeVC", "CustomTabBar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Example List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
}

extension ExampleListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExampleListCell = tableView.dequeueReusableCell(withIdentifier: ExampleListCell.identifier, for: indexPath) as? ExampleListCell else { return UITableViewCell() }
        
        cell.titleLabel.text = self.examList[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.examList.count
    }
}

extension ExampleListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.examList[indexPath.row] == "CustomTabBar" {
            self.navigationController?.pushViewController(CustomTabBar(), animated: true)
        } else {
            guard let nv = self.storyboard?.instantiateViewController(withIdentifier: self.examList[indexPath.row]) else { return }
            
            self.navigationController?.pushViewController(nv, animated: true)
        }
    }
}
