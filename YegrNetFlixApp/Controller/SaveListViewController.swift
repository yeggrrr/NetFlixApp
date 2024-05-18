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
        navigationItem.title = "저장한 콘텐츠 목록"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // titleLabel
        titleLabel.text = "'나만의 자동 저장' 기능"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 23)
        titleLabel.contentMode = .center
        
        // descriptionLabel
        descriptionLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해드립니다. \n디바이스에 언제나 시청할 콘텐츠가 준비되니 \n지루할 틈이 없어요!"
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.contentMode = .center
        
        // titleImageView
        titleImageView.image = UIImage(named: "dummy")
        titleImageView.contentMode = .scaleAspectFill
        
        // settingButton
        settingButton.backgroundColor = .systemBlue
        settingButton.setTitle("설정하기", for: .normal)
        settingButton.tintColor = .white
        settingButton.layer.cornerRadius = 5
        
        // detailButton
        detailButton.backgroundColor = .white
        detailButton.setTitle("설정하기", for: .normal)
        detailButton.tintColor = .black
        detailButton.layer.cornerRadius = 5
    }
}
