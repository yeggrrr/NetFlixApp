//
//  SignUpViewController.swift
//  YegrNetFlixApp
//
//  Created by YJ on 5/16/24.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var logoLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommendCodeTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var addInfoLabel: UILabel!
    @IBOutlet var addInfoSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        // labelUI
        logoLabel.setCustomUI("YEGRFLIX", textColorStyle: .systemRed, .center)
        addInfoLabel.setCustomUI("추가 정보 입력", textColorStyle: .white, .left)
        addInfoLabel.font = .boldSystemFont(ofSize: 17)
        
        // textFieldUI
        emailTextField.setCustomUI("이메일 주소 또는 전화번호", false, .emailAddress)
        passwordTextField.setCustomUI("비밀번호", true, .default)
        nicknameTextField.setCustomUI("닉네임", false, .default)
        locationTextField.setCustomUI("위치", false, .default)
        recommendCodeTextField.setCustomUI("추천 코드", false, .numberPad)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
       // signUpButton
        signUpButton.signUpStyle()
        
        // addInfoSwitch
        addInfoSwitch.onTintColor = .systemRed
    }
    
    // textfield return exit action
    @IBAction func emailTextFieldDoneButtonClicekd(_ sender: UITextField) {
    }
    
    @IBAction func passwordTextFieldDoneButtonClicekd(_ sender: UITextField) {
    }
    
    @IBAction func nicknameTextFieldDoneButtonClicekd(_ sender: UITextField) {
    }
    
    @IBAction func locationTextFieldDoneButtonClicekd(_ sender: UITextField) {
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UITextField {
    func setCustomUI(_ placeholderText: String, _ isSecureText: Bool, _ keyboardStyle: UIKeyboardType) {
        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        backgroundColor = .darkGray
        textColor = .white
        keyboardType = keyboardStyle
        isSecureTextEntry = isSecureText
        returnKeyType = .done
        keyboardAppearance = .dark
    }
}

extension UIButton {
    func signUpStyle() {
        setTitle("회원가입", for: .normal)
        setTitle("회원가입", for: .highlighted)
        setTitleColor(.black, for: .normal)
        setTitleColor(.darkGray, for: .highlighted)
        configuration?.titleAlignment = .center
        backgroundColor = .white
        layer.cornerRadius = 8
    }
}

extension UILabel {
    func setCustomUI(_ title: String, textColorStyle: UIColor, _ alignment: NSTextAlignment) {
        text = title
        textColor = textColorStyle
        textAlignment = alignment
    }
}
