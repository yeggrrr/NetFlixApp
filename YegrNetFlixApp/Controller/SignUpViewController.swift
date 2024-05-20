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
        labelUI(logoLabel, "YEGRFLIX", .systemRed, .center)
        labelUI(addInfoLabel, "추가 정보 입력", .white, .left)
        addInfoLabel.font = .boldSystemFont(ofSize: 17)
        
        // textFieldUI
        textFieldUI(emailTextField, "이메일 주소 또는 전화번호", false, .emailAddress)
        textFieldUI(passwordTextField, "비밀번호", true, .default)
        textFieldUI(nicknameTextField, "닉네임", false, .default)
        textFieldUI(locationTextField, "위치", false, .default)
        textFieldUI(recommendCodeTextField, "추천 코드", false, .numberPad)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
       // signUpButton
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitle("회원가입", for: .highlighted)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.setTitleColor(.darkGray, for: .highlighted)
        signUpButton.configuration?.titleAlignment = .center
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 8
        
        // addInfoSwitch
        addInfoSwitch.onTintColor = .systemRed
    }
    
    func textFieldUI(_ textField: UITextField, _ placeholderText: String, _ isSecureText: Bool, _ keyboardType: UIKeyboardType) {
        
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.keyboardType = .default
        textField.isSecureTextEntry = isSecureText
        textField.returnKeyType = .done
        textField.keyboardAppearance = .dark
    }
    
    func labelUI(_ label: UILabel, _ text: String, _ textColor: UIColor, _ alignment: NSTextAlignment) {
        label.text = text
        label.textColor = textColor
        label.textAlignment = .center
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
