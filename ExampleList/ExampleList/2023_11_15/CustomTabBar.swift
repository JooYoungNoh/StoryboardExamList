//
//  CustomTabBar.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/15.
//

import UIKit

class CustomTabBar: UITabBarController {

    //기존 탭바를 대신 할 뷰
    let csView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    //경계선 뷰
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    let bearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bearGlass"), for: .normal)
        button.layer.cornerRadius = 20
        button.tag = 0
        button.isSelected = false
        return button
    }()

    let bearLabel: UILabel = {
        let label = UILabel()
        label.text = "Bear"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    
    let showkButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 100, weight: .light)
        button.setImage(UIImage(named: "showGlass"), for: .normal)
        button.layer.cornerRadius = 20
        button.tag = 1
        button.isSelected = false
        return button
    }()
        //레이블
    let showLabel: UILabel = {
        let label = UILabel()
        label.text = "Show"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //기존 탭바 숨김
        self.tabBar.isHidden = true
        
        //검색 부분
        let bearNavi = UINavigationController(rootViewController: BearVC())
        //즐겨찾기 부분
        let showNavi = UINavigationController(rootViewController: ShowVC())
        //탭에 따른 화면 전환을 위해 저장
        viewControllers = [bearNavi,showNavi]
        
        self.uiCreate()
        self.onClick(self.bearButton)             //초기값 설정
    }
    
    //MARK: 액션 메소드
    @objc func onClick(_ sender: UIButton){
        self.bearButton.isSelected = false
        self.showkButton.isSelected = false
        sender.isSelected = true
        self.selectedIndex = sender.tag
        
        switch sender {
        case self.bearButton:
            //UI 변경
            self.bearButton.tintColor = .systemYellow
            self.bearLabel.textColor = .black
            self.showkButton.tintColor = .systemGray4
            self.showLabel.textColor = .systemGray4
            
            //화면 변경
            
        case self.showkButton:
            //UI 변경
            self.bearButton.tintColor = .systemGray4
            self.bearLabel.textColor = .systemGray4
            self.showkButton.tintColor = .systemYellow
            self.showLabel.textColor = .black
        default:
            break
        }
    }
    
    //MARK: 화면 메소드
    func uiCreate(){
        
        let offset = (self.view.frame.width-120)/3
        
        //커스텀 탭바
        self.view.addSubview(self.csView)
        self.csView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(120)
        }
        
        //경계선
        self.view.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.csView.snp.top)
            make.height.equalTo(2)
        }
        
        //검색 부분
            //버튼
        self.bearButton.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        self.csView.addSubview(self.bearButton)
        self.bearButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(offset)
            make.width.height.equalTo(50)
        }
            //레이블
        self.csView.addSubview(self.bearLabel)
        self.bearLabel.snp.makeConstraints { make in
            make.top.equalTo(self.bearButton.snp.bottom).offset(5)
            make.centerX.equalTo(self.bearButton.snp.centerX)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        //즐겨찾기 부분
            //버튼
        self.showkButton.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        self.csView.addSubview(self.showkButton)
        self.showkButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-offset)
            make.width.height.equalTo(50)
        }
            //레이블
        self.csView.addSubview(self.showLabel)
        self.showLabel.snp.makeConstraints { make in
            make.top.equalTo(self.showkButton.snp.bottom).offset(5)
            make.centerX.equalTo(self.showkButton.snp.centerX)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
    }

}
