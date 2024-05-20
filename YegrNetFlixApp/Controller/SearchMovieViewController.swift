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
        buttonUI(upComingButton, "blue", " 공개 예정")
        buttonUI(popularButton, "turquoise", " 모두의 인기 콘텐츠")
        buttonUI(topTenButton, "pink", " TOP 10 시리즈")
        
        // labelUI
        labelUI(noticeLabel, "검색어 없음", 25)
        labelUI(recommendLabel, "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.", 15)

    }
    
    func buttonUI(_ button: UIButton ,_ imageName: String, _ title: String) {
       
        button.backgroundColor = .darkGray
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setTitle(title, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 15
    }
    
    func labelUI(_ label: UILabel, _ text: String, _ fontSize: CGFloat) {
       
        label.text = text
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: fontSize)
        label.contentMode = .center
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
        buttonClickedUI(upComingButton, .darkGray, .white)
        buttonClickedUI(popularButton, .darkGray, .white)
        buttonClickedUI(topTenButton, .darkGray, .white)
        
        if searchMovieTextField.text == "" {
            instructionsLabel("검색어 없음", "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.")
        } else {
            instructionsLabel("이런! 찾으시는 작품이 없습니다.", "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요.")
        }
    }
    
    @IBAction func upComingButtonClicked(_ sender: UIButton) {
        instructionsLabel("아직 공개 예정 작품이 없습니다.", "조금만 기다려주세요!")
        buttonClickedUI(upComingButton, .white, .black)
        buttonClickedUI(popularButton, .darkGray, .white)
        buttonClickedUI(topTenButton, .darkGray, .white)
    }
    
    @IBAction func popularButtonClicked(_ sender: UIButton) {
        instructionsLabel("인기 콘텐츠 업데이트 예정입니다.", "조금만 기다려주세요!")
        buttonClickedUI(upComingButton, .darkGray, .white)
        buttonClickedUI(popularButton, .white, .black)
        buttonClickedUI(topTenButton, .darkGray, .white)
    }
    
    @IBAction func topTenButtonClicked(_ sender: UIButton) {
        instructionsLabel("Top 10 시리즈!", "조금만 기다려주세요!")
        buttonClickedUI(upComingButton, .darkGray, .white)
        buttonClickedUI(popularButton, .darkGray, .white)
        buttonClickedUI(topTenButton, .white, .black)
    }
}
