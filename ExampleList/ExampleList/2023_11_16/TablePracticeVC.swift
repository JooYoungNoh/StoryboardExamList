//
//  TablePracticeVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/16.
//

import UIKit

struct TablePracticeModel {
    var attractionNames: String
    var webAddresses: String
    var image: UIImage
}

class TablePracticeVM {
    var items: [TablePracticeModel] = []
}

class TablePracticeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = TablePracticeVM()
    
    //서치바
    var searching: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    var matchArr: [Int] = []
    var searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiButtonCreate()
        self.uiSearchBarCreate()
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

//MARK: 서치바 메소드
extension TablePracticeVC {
    func uiSearchBarCreate() {
        //서치바 UI
        self.searchController.searchBar.delegate = self
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.placeholder = "Search Name"
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.definesPresentationContext = true
        
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension TablePracticeVC: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        self.matchArr.removeAll()
        for index in 0..<self.viewModel.items.count {
            if self.viewModel.items[index].attractionNames.lowercased().contains(text.lowercased()) {
                self.matchArr.append(index)
            }
        }
        self.tableView.reloadData()
    }
}

//MARK: 버튼 메소드
extension TablePracticeVC {
    @objc func buttonClick(_ sender: UIBarButtonItem) {
        guard let addView = self.storyboard?.instantiateViewController(identifier: "TableAddVC") as? TableAddVC else { return }
        addView.modalPresentationStyle = .overCurrentContext
        addView.modalTransitionStyle = .crossDissolve
        
        addView.viewModel = self.viewModel
        addView.tableView = self.tableView
        self.present(addView, animated: true)
    }
    
    func uiButtonCreate() {
        let addButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(buttonClick(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        self.tableView.separatorStyle = .none
    }
}


//MARK: 테이블 뷰 메소드
extension TablePracticeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TablePracticeCell", for: indexPath) as? TablePracticeCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.profileImageView.layer.cornerRadius = 20
        
        if self.searching {
            cell.nameLabel.text = self.viewModel.items[self.matchArr[indexPath.row]].attractionNames
            cell.profileImageView.image = self.viewModel.items[self.matchArr[indexPath.row]].image
        } else {
            cell.nameLabel.text = self.viewModel.items[indexPath.row].attractionNames
            cell.profileImageView.image = self.viewModel.items[indexPath.row].image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searching ? self.matchArr.count : self.viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140 
    }
}

extension TablePracticeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextView = self.storyboard?.instantiateViewController(identifier: "TableDetailVC") as? TableDetailVC else { return }
        
        nextView.webSite = self.searching ? self.viewModel.items[self.matchArr[indexPath.row]].webAddresses : self.viewModel.items[indexPath.row].webAddresses
        
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if self.searching {
                self.viewModel.items.remove(at: self.matchArr[indexPath.row])
                self.matchArr.remove(at: indexPath.row)
            } else {
                self.viewModel.items.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
}
