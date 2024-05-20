//
//  MainViewController.swift
//  YegrNetFlixApp
//
//  Created by YJ on 5/16/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var logoutBarButtonItem: UIBarButtonItem!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var addWishListButton: UIButton!
    @IBOutlet var centerLabel: UILabel!
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var firstBadgeImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var secondBadgeImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    @IBOutlet var thirdBadgeImageView: UIImageView!
    
    let posterList: [String] = ["노량", "밀수", "서울의봄", "콘크리트유토피아", "더퍼스트슬램덩크", "범죄도시3", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        title = "YEGR님"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // logoutBarButtonItem
        logoutBarButtonItem.title = "로그아웃"
        logoutBarButtonItem.tintColor = .white
        
        // imageViewUI
        posterImageView.setUI("노량", cornerRadius:15)
        firstImageView.setUI("밀수", cornerRadius:10)
        secondImageView.setUI("서울의봄", cornerRadius:10)
        thirdImageView.setUI("콘크리트유토피아", cornerRadius:10)
        
        // labelUI
        genreLabel.setUI("응원하고픈 ・ 흥미진진 ・ 사극 ・ 전투 ・ 한국 작품", .center)
        centerLabel.setUI("지금 뜨는 콘텐츠", .left)
        
        // buttonUI
        playButton.setUI(.white, .black, "play.fill", "   재생")
        addWishListButton.setUI(.darkGray, .white, "plus", " 내가 찜한 리스트")
        
        // // badgeImageViewUI
        firstBadgeImageView.setBadgeUI("top10 badge", hidden: false)
        secondBadgeImageView.setBadgeUI("top10 badge", hidden: false)
        thirdBadgeImageView.setBadgeUI("single-badge", hidden: false)
    }
    
    @IBAction func logoutBarButtonItemClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        var randomNums: Set<Int> = []
        
        while randomNums.count < 4 {
            let num = Int.random(in: 0...9)
            randomNums.insert(num)
        }
        
        let randomArray = Array(randomNums)
        var imageList: [String] = []
        
        for i in 0..<randomArray.count {
            let num = randomArray[i]
            imageList.append(posterList[num])
        }
        
        let imageViews = [posterImageView, firstImageView, secondImageView, thirdImageView]
        
        for i in 0..<imageViews.count {
            let imageName = imageList[i]
            let imageView = imageViews[i]
            imageView?.image = UIImage(named: imageName)
        }
        
        let boolList:[Bool] = [true, false]
        
        [firstBadgeImageView, secondBadgeImageView, thirdBadgeImageView].forEach {
            $0.isHidden = boolList.randomElement() ?? false
        }
    }
}

extension UIImageView {
    func setUI(_ imageName: String , cornerRadius: CGFloat) {
        image = UIImage(named: imageName)
        layer.cornerRadius = cornerRadius
        contentMode = .scaleAspectFill
    }
    
    func setBadgeUI(_ badgeName: String, hidden: Bool) {
        image = UIImage(named: badgeName)
        contentMode = .scaleToFill
        isHidden = hidden
    }
}

extension UIButton {
    func setUI(_ backgroundColorStyle: UIColor, _ tintColorStyle: UIColor, _ imageName: String, _ title: String) {
        backgroundColor = backgroundColorStyle
        setImage(UIImage(systemName: imageName), for: .normal)
        setTitle(title, for: .normal)
        tintColor = tintColorStyle
        layer.cornerRadius = 5
    }
}

extension UILabel {
    func setUI(_ title: String, _ alignment: NSTextAlignment) {
        text = title
        font = .boldSystemFont(ofSize: 17)
        textColor = .white
        textAlignment = alignment
    }
}
