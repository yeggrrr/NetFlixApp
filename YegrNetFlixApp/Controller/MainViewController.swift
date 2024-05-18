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
        
        // posterImageView
        posterImageView.image = UIImage(named: "노량")
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 15
        
        // genreLabel
        genreLabel.text = "응원하고픈 ・ 흥미진진 ・ 사극 ・ 전투 ・ 한국 작품"
        genreLabel.font = .boldSystemFont(ofSize: 17)
        genreLabel.textColor = .white
        genreLabel.textAlignment = .center
        
        // playButton
        playButton.backgroundColor = .white
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.setTitle("   재생", for: .normal)
        playButton.tintColor = .black
        playButton.titleLabel?.textColor = .black
        playButton.layer.cornerRadius = 5
        
        // addWishListButton
        addWishListButton.backgroundColor = .darkGray
        addWishListButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addWishListButton.setTitle(" 내가 찜한 리스트", for: .normal)
        addWishListButton.tintColor = .white
        addWishListButton.layer.cornerRadius = 5
        
        // centerLabel
        centerLabel.text = "지금 뜨는 콘텐츠"
        centerLabel.font = .boldSystemFont(ofSize: 17)
        centerLabel.textColor = .white
        centerLabel.textAlignment = .left
        
        // firstImageView
        firstImageView.image = UIImage(named: "밀수")
        firstImageView.layer.cornerRadius = 10
        firstImageView.contentMode = .scaleAspectFill
        
        // secondImageView
        secondImageView.image = UIImage(named: "서울의봄")
        secondImageView.layer.cornerRadius = 10
        secondImageView.contentMode = .scaleAspectFill
        
        // thirdImageView
        thirdImageView.image = UIImage(named: "콘크리트유토피아")
        thirdImageView.layer.cornerRadius = 10
        thirdImageView.contentMode = .scaleAspectFill
        
        // firstBadgeImageView
        firstBadgeImageView.image = UIImage(named: "top10 badge")
        firstBadgeImageView.contentMode = .scaleToFill
        firstBadgeImageView.isHidden = false
        
        // secondBadgeImageView
        secondBadgeImageView.image = UIImage(named: "top10 badge")
        secondBadgeImageView.contentMode = .scaleToFill
        secondBadgeImageView.isHidden = false
        
        // thirdBadgeImageView
        thirdBadgeImageView.image = UIImage(named: "single-badge")
        thirdBadgeImageView.contentMode = .scaleToFill
        thirdBadgeImageView.isHidden = false
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
