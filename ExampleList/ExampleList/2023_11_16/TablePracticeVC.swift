//
//  TablePracticeVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/16.
//

import UIKit

class TablePracticeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [["Kim", "glassesGlass"], ["Lee", "dinosaurGlass"], ["Park", "friendGlass"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension TablePracticeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TablePracticeCell", for: indexPath) as? TablePracticeCell else { return UITableViewCell() }
        
        cell.nameLabel.text = self.items[indexPath.row][0]
        cell.profileImageView.image = UIImage(named: self.items[indexPath.row][1])
        cell.profileImageView.layer.cornerRadius = 20
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140    }
}

extension TablePracticeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
}
