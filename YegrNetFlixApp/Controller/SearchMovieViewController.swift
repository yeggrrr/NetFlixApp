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
        
        // upComingButton
        upComingButton.backgroundColor = .darkGray
        upComingButton.setImage(UIImage(named: "blue"), for: .normal)
        upComingButton.setTitle(" 공개 예정", for: .normal)
        upComingButton.tintColor = .white
        upComingButton.layer.cornerRadius = 15
        
        /*
         
        upComingButton.titleLabel?.font = .systemFont(ofSize: 20)
        -> default에서만 먹힘. (plain X)
        
         let image = UIImage(named: "example")?.withRenderingMode(.alwaysOriginal)
        ->default로 바꾸고, 이미지가 깨지는 경우 설정 / assets에서 설정 가능 render As - original Image
         
         alwaysTemplate는 왜있을까?
         systemName으로 가져온 이미지의 컬러를 변경하고 싶을 때, 필요하다!
         
         let image = UIImage(systemName: "star")?.withTintColor(.black)
         이렇게!!
         
         */
        
        // popularButton
        popularButton.backgroundColor = .darkGray
        popularButton.setImage(UIImage(named: "turquoise"), for: .normal)
        popularButton.setTitle(" 모두의 인기 콘텐츠", for: .normal)
        popularButton.tintColor = .white
        popularButton.layer.cornerRadius = 15
        
        // topTenButton
        topTenButton.backgroundColor = .darkGray
        topTenButton.setImage(UIImage(named: "pink"), for: .normal)
        topTenButton.setTitle(" TOP 10 시리즈", for: .normal)
        topTenButton.tintColor = .white
        topTenButton.layer.cornerRadius = 15
        
        // noticeLabel
        noticeLabel.text = "검색어 없음"
        noticeLabel.textColor = .white
        noticeLabel.font = .boldSystemFont(ofSize: 25)
        noticeLabel.contentMode = .center
        
        // recommendLabel
        recommendLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        recommendLabel.numberOfLines = 0
        recommendLabel.textColor = .white
        recommendLabel.font = .boldSystemFont(ofSize: 15)
        recommendLabel.contentMode = .center
    }
    
    @IBAction func searchTextFieldReturnButtonClicked(_ sender: UITextField) {
        upComingButton.backgroundColor = .darkGray
        upComingButton.tintColor = .white
        popularButton.backgroundColor = .darkGray
        popularButton.tintColor = .white
        topTenButton.backgroundColor = .darkGray
        topTenButton.tintColor = .white
        
        if searchMovieTextField.text == "" {
            noticeLabel.text = "검색어 없음"
            recommendLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        } else {
            noticeLabel.text = "이런! 찾으시는 작품이 없습니다."
            recommendLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        }
    }
    
    @IBAction func upComingButtonClicked(_ sender: UIButton) {
        noticeLabel.text = "아직 공개 예정 작품이 없습니다."
        recommendLabel.text = "조금만 기다려주세요!"
        upComingButton.backgroundColor = .white
        upComingButton.tintColor = .black
        popularButton.backgroundColor = .darkGray
        popularButton.tintColor = .white
        topTenButton.backgroundColor = .darkGray
        topTenButton.tintColor = .white
    }
    
    @IBAction func popularButtonClicked(_ sender: UIButton) {
        noticeLabel.text = "인기 콘텐츠 업데이트 예정입니다."
        recommendLabel.text = "조금만 기다려주세요!"
        upComingButton.backgroundColor = .darkGray
        upComingButton.tintColor = .white
        popularButton.backgroundColor = .white
        popularButton.tintColor = .black
        topTenButton.backgroundColor = .darkGray
        topTenButton.tintColor = .white
    }
    
    @IBAction func topTenButtonClicked(_ sender: UIButton) {
        noticeLabel.text = "Top 10 시리즈!"
        recommendLabel.text = "조금만 기다려주세요!"
        upComingButton.backgroundColor = .darkGray
        upComingButton.tintColor = .white
        popularButton.backgroundColor = .darkGray
        popularButton.tintColor = .white
        topTenButton.backgroundColor = .white
        topTenButton.tintColor = .black
    }
}
