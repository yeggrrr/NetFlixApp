//
//  SearchMovieViewController.swift
//  YegrNetFlixApp
//
//  Created by YJ on 5/16/24.
//

import UIKit

class SearchMovieViewController: UIViewController {
    @IBOutlet var searchMovieTextField: UITextField!
    @IBOutlet var upComingButton: UIButton!
    @IBOutlet var popularButton: UIButton!
    @IBOutlet var topTenButton: UIButton!
    @IBOutlet var noticeLabel: UILabel!
    @IBOutlet var recommendLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        navigationItem.title = "NEW & HOT 검색"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // searchMovieTextField
        searchMovieTextField.attributedPlaceholder = NSAttributedString(
            string: "게임, 시리즈, 영화를 검색하세요..",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        searchMovieTextField.backgroundColor = .darkGray
        searchMovieTextField.textColor = .white
        searchMovieTextField.keyboardType = .default
        searchMovieTextField.returnKeyType = .default
        searchMovieTextField.keyboardAppearance = .dark
        searchMovieTextField.tintColor = .black
        
        // buttonUI
        upComingButton.setCategoryUI("blue", " 공개 예정")
        popularButton.setCategoryUI("turquoise", " 모두의 인기 콘텐츠")
        topTenButton.setCategoryUI("pink", " TOP 10 시리즈")
        
        // labelUI
        noticeLabel.setUI("검색어 없음", 25)
        recommendLabel.setUI("다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.", 15)
    }
    
    func buttonClickedUI(_ button: UIButton, _ backgroundColor: UIColor, _ tintColor: UIColor) {
        button.backgroundColor = backgroundColor
        button.tintColor = tintColor
    }
    
    func instructionsLabel(_ notice: String, _ recommend: String) {
        noticeLabel.text = notice
        recommendLabel.text = recommend
    }
    
    @IBAction func searchTextFieldReturnButtonClicked(_ sender: UITextField) {
        upComingButton.setCustomUI(style: .initialized)
        popularButton.setCustomUI(style: .initialized)
        topTenButton.setCustomUI(style: .initialized)
        
        if searchMovieTextField.text == "" {
            instructionsLabel("검색어 없음", "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.")
        } else {
            instructionsLabel("이런! 찾으시는 작품이 없습니다.", "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.")
        }
    }
    
    @IBAction func upComingButtonClicked(_ sender: UIButton) {
        instructionsLabel("아직 공개 예정 작품이 없습니다.", "조금만 기다려주세요!")
        upComingButton.setCustomUI(style: .clicked)
        popularButton.setCustomUI(style: .initialized)
        topTenButton.setCustomUI(style: .initialized)
    }
    
    @IBAction func popularButtonClicked(_ sender: UIButton) {
        instructionsLabel("인기 콘텐츠 업데이트 예정입니다.", "조금만 기다려주세요!")
        upComingButton.setCustomUI(style: .initialized)
        popularButton.setCustomUI(style: .clicked)
        topTenButton.setCustomUI(style: .initialized)
    }
    
    @IBAction func topTenButtonClicked(_ sender: UIButton) {
        instructionsLabel("Top 10 시리즈!", "조금만 기다려주세요!")
        upComingButton.setCustomUI(style: .initialized)
        popularButton.setCustomUI(style: .initialized)
        topTenButton.setCustomUI(style: .clicked)
    }
}

extension UIButton {
    func setCustomUI(style: ButtonStyle) {
        switch style {
        case .clicked:
            backgroundColor = .white
            tintColor = .black
        case .initialized:
            backgroundColor = .darkGray
            tintColor = .white
        }
    }
    
    func setCategoryUI(_ imageName: String, _ title: String) {
        backgroundColor = .darkGray
        setImage(UIImage(named: imageName), for: .normal)
        setTitle(title, for: .normal)
        tintColor = .white
        layer.cornerRadius = 15
    }
}

extension UILabel {
    func setUI(_ title: String, _ fontSize: CGFloat) {
        text = title
        textColor = .white
        numberOfLines = 0
        font = .boldSystemFont(ofSize: fontSize)
        contentMode = .center
    }
}

enum ButtonStyle {
    case clicked
    case initialized
}
