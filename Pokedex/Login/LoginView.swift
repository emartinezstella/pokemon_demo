//
//  ViewController.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 10/07/23.
//

import UIKit
import SnapKit

class LoginView: UIViewController {
  
    private let imgLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "logo")
        return imageView
    }()
    
    private let logInText: UILabel = {
        let label = UILabel()
        label.text = "Iniciar sesión"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let welcomeText: UILabel = {
        let label = UILabel()
        label.text = "Bienvenido de nuevo, ingresa los campos\nque se te solicitan"
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = UIColor(hex:"6B6F76")
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let usernameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Usuario"
        return textfield
    }()
    
    private let passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Contraseña"
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let showPasswordButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "visibility_off")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(hex: "6B6F76")
        return button
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Iniciar sesión", for: .normal)
        button.backgroundColor = UIColor(hex:"2B72B9")
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let orJoinWithText: UILabel = {
        let label = UILabel()
        label.text = "o unirse con"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let logInWithGoogleButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Continuar con Google", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "google") , for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(hex: "D0D5DD")!.cgColor
        return button
    }()
    
    private let logInWithFacebookButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Continuar con Facebook", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "facebook") , for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(hex: "D0D5DD")!.cgColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(imgLogo)
        imgLogo.snp.makeConstraints { make in
            make.top.equalTo(guide).offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(250)
        }
        
        view.addSubview(logInText)
        logInText.snp.makeConstraints { make in
            make.top.equalTo(imgLogo.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        view.addSubview(welcomeText)
        welcomeText.snp.makeConstraints { make in
            make.top.equalTo(logInText.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        view.addSubview(usernameTextfield)
        usernameTextfield.snp.makeConstraints { make in
            make.top.equalTo(welcomeText.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
        
        view.addSubview(passwordTextfield)
        passwordTextfield.snp.makeConstraints { make in
            make.top.equalTo(usernameTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
        
        view.addSubview(showPasswordButton)
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextfield)
            make.trailing.equalTo(passwordTextfield).offset(-5)
            make.height.width.equalTo(20)
        }
        
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        
        view.addSubview(orJoinWithText)
        orJoinWithText.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        view.addSubview(logInWithGoogleButton)
        logInWithGoogleButton.snp.makeConstraints { make in
            make.top.equalTo(orJoinWithText.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(38)
        }
        
        view.addSubview(logInWithFacebookButton)
        logInWithFacebookButton.snp.makeConstraints { make in
            make.top.equalTo(logInWithGoogleButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(38)
        }
        
        logInButton.addTarget(self, action: #selector(logInButtonDidTap), for: .touchUpInside)
    }
    
    @objc func logInButtonDidTap(){
        let vc = PokemonListView()
        let nv = UINavigationController(rootViewController: vc)
        nv.modalPresentationStyle = .fullScreen
        self.present(nv, animated: true)
    }

}

