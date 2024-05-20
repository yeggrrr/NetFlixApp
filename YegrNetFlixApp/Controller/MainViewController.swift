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
        imageViewUI(posterImageView, "노량", 15)
        imageViewUI(firstImageView, "밀수", 10)
        imageViewUI(secondImageView, "서울의봄", 10)
        imageViewUI(thirdImageView, "콘크리트유토피아", 10)
        
        // labelUI
        labelUI(genreLabel, "응원하고픈 ・ 흥미진진 ・ 사극 ・ 전투 ・ 한국 작품", .center)
        labelUI(centerLabel, "지금 뜨는 콘텐츠", .left)
        
        // buttonUI
        buttonUI(playButton, .white, .black, "play.fill", "   재생")
        buttonUI(addWishListButton, .darkGray, .white, "plus", " 내가 찜한 리스트")
        
        // // badgeImageViewUI
        badgeImageViewUI(firstBadgeImageView, "top10 badge", false)
        badgeImageViewUI(secondBadgeImageView, "top10 badge", false)
        badgeImageViewUI(thirdBadgeImageView, "single-badge", false)
    }
    
    func labelUI(_ label: UILabel, _ text: String, _ alignment: NSTextAlignment) {
        label.text = text
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = alignment
    }
    
    func imageViewUI(_ imageView: UIImageView, _ imageName: String , _ cornerRadius: CGFloat) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = cornerRadius
        imageView.contentMode = .scaleAspectFill
    }
    
    func badgeImageViewUI(_ imageView: UIImageView, _ badgeName: String, _ isHidden: Bool) {
        imageView.image = UIImage(named: badgeName)
        imageView.contentMode = .scaleToFill
        imageView.isHidden = isHidden
    }
    
    func buttonUI(_ button: UIButton, _ backgroundColor: UIColor, _ tintColor: UIColor, _ imageName: String, _ title: String) {
        button.backgroundColor = backgroundColor
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.setTitle(title, for: .normal)
        button.tintColor = tintColor
        button.layer.cornerRadius = 5
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
        let firstNum = randomArray[0]
        let secondNum = randomArray[1]
        let thirdNum = randomArray[2]
        let forthNum = randomArray[3]
        
        let posterImage = posterList[firstNum]
        let firstImage = posterList[secondNum]
        let secondImage = posterList[thirdNum]
        let thirdImage = posterList[forthNum]
        
        posterImageView.image = UIImage(named: "\(posterImage)")
        firstImageView.image = UIImage(named: "\(firstImage)")
        secondImageView.image = UIImage(named: "\(secondImage)")
        thirdImageView.image = UIImage(named: "\(thirdImage)")
        
        let firstBoolType:[Bool] = [true, false]
        guard let firstRandomBool = firstBoolType.randomElement() else { return }
        
        let secondBoolType:[Bool] = [true, false]
        guard let secondRandomBool = secondBoolType.randomElement() else { return }
        
        let thirdBoolType:[Bool] = [true, false]
        guard let thirdRandomBool = thirdBoolType.randomElement() else { return }
        
        firstBadgeImageView.isHidden = firstRandomBool
        secondBadgeImageView.isHidden = secondRandomBool
        thirdBadgeImageView.isHidden = thirdRandomBool
    }
}
