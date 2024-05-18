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
        
        // logoLabel - font: blackStyle로 하고 싶은데 못 찾아서 스토리보드로 설정
        logoLabel.text = "YEGRFLIX"
        logoLabel.textColor = .systemRed
        logoLabel.textAlignment = .center
        
        //emailTextField
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "이메일 주소 또는 전화번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        emailTextField.backgroundColor = .darkGray
        emailTextField.textColor = .white
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .done
        emailTextField.keyboardAppearance = .dark
        
        // passwordTextField
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.backgroundColor = .darkGray
        passwordTextField.textColor = .white
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        passwordTextField.keyboardAppearance = .dark
        
        // nicknameTextField
        nicknameTextField.attributedPlaceholder = NSAttributedString(
            string: "닉네임",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        nicknameTextField.backgroundColor = .darkGray
        nicknameTextField.textColor = .white
        nicknameTextField.keyboardType = .default
        nicknameTextField.returnKeyType = .done
        nicknameTextField.keyboardAppearance = .dark
        
        // locationTextField
        locationTextField.attributedPlaceholder = NSAttributedString(
            string: "위치",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        locationTextField.backgroundColor = .darkGray
        locationTextField.textColor = .white
        locationTextField.keyboardType = .default
        locationTextField.returnKeyType = .done
        locationTextField.keyboardAppearance = .dark
        
        // recommendCodeTextField
        recommendCodeTextField.attributedPlaceholder = NSAttributedString(
            string: "추천 코드",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        recommendCodeTextField.backgroundColor = .darkGray
        recommendCodeTextField.textColor = .white
        recommendCodeTextField.keyboardType = .numberPad
        recommendCodeTextField.keyboardAppearance = .dark
        
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
        
        // addInfoLabel
        addInfoLabel.text = "추가 정보 입력"
        addInfoLabel.textColor = .white
        addInfoLabel.textAlignment = .left
        addInfoLabel.font = .boldSystemFont(ofSize: 17)
        
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
