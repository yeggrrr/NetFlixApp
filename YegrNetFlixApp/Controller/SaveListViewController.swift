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
        titleLabel.setCustomTitle("'나만의 자동 저장' 기능", fontSize: 23)
        descriptionLabel.setCustomTitle("취향에 맞는 영화와 시리즈를 자동으로 저장해드립니다. \n디바이스에 언제나 시청할 콘텐츠가 준비되니 \n지루할 틈이 없어요!", fontSize: 15)
        
        // buttonUI
        settingButton.setCustomUI("설정하기", background: .systemBlue, tint: .white)
        detailButton.setCustomUI("저장 가능한 콘텐츠 살펴보기", background: .white, tint: .black)
        
        // titleImageView
        titleImageView.image = UIImage(named: "dummy")
        titleImageView.contentMode = .scaleAspectFill
    }
    
    func navigationUI() {
        navigationItem.title = "저장한 콘텐츠 목록"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

extension UILabel {
    func setCustomTitle(_ title: String, fontSize: CGFloat) {
        text = title
        textColor = .white
        font = .boldSystemFont(ofSize: fontSize)
        textAlignment = .center
        contentMode = .center
    }
}

extension UIButton {
    func setCustomUI(_ title: String, background: UIColor, tint: UIColor) {
        backgroundColor = background
        setTitle(title, for: .normal)
        tintColor = tint
        layer.cornerRadius = 5
    }
}
