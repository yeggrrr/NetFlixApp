//
//  SaveListViewController.swift
//  YegrNetFlixApp
//
//  Created by YJ on 5/16/24.
//

import UIKit

class SaveListViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var titleImageView: UIImageView!
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var detailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        navigationUI()
        
        // labelUI
        labelUI(titleLabel, "'나만의 자동 저장' 기능", 23)
        labelUI(descriptionLabel, "취향에 맞는 영화와 시리즈를 자동으로 저장해드립니다. \n디바이스에 언제나 시청할 콘텐츠가 준비되니 \n지루할 틈이 없어요!", 15)
        
        // buttonUI
        buttonUI(settingButton, .systemBlue, "설정하기", .white)
        buttonUI(detailButton, .white, "저장 가능한 콘텐츠 살펴보기", .black)
        
        // titleImageView
        titleImageView.image = UIImage(named: "dummy")
        titleImageView.contentMode = .scaleAspectFill

    }
    
    func navigationUI() {
        navigationItem.title = "저장한 콘텐츠 목록"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func labelUI(_ label: UILabel ,_ text: String, _ fontSize: CGFloat) {
        label.text = text
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: fontSize)
        label.textAlignment = .center
        label.contentMode = .center
    }
    
    func buttonUI(_ button: UIButton, _ backgroundColor: UIColor, _ title: String, _ tintColor: UIColor) {
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
        button.tintColor = tintColor
        button.layer.cornerRadius = 5
    }
}
