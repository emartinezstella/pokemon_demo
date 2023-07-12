//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 12/07/23.
//

import UIKit
import SnapKit

class PokemonDetailView: UIViewController {
    
    private let pokemonNameText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textColor = .white
        label.text = "Charizard"
        return label
    }()
    
    private let pokemonNumberText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.text = "#001"
        return label
    }()
    
    private let pokemonTypeText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = .white
        label.backgroundColor = .white.withAlphaComponent(0.4)
        label.text = "Fuego"
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    private let pokemonType2Text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = .white
        label.backgroundColor = .white.withAlphaComponent(0.4)
        label.text = "Volar"
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    private let pokemonImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "chari")
        return imageView
    }()
    
    private let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let aboutText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Acerca de"
        return label
    }()
    
    let stackView : UIStackView = {
        let stackview = UIStackView()
        stackview.clipsToBounds = true
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        return stackview
    }()
    
    let stackViewStats : UIStackView = {
        let stackview = UIStackView()
        stackview.clipsToBounds = true
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        return stackview
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detalle"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let imgBack = UIImage(named: "arrow-left")
        navigationController?.navigationBar.backIndicatorImage = imgBack
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
       
        view.backgroundColor = .random().withAlphaComponent(0.7)
        
        setupUI()
    }
    
    func setupUI(){
        
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(pokemonNameText)
        pokemonNameText.snp.makeConstraints { make in
            make.top.equalTo(guide).offset(10)
            make.leading.equalToSuperview().offset(16)
        }
        
        view.addSubview(pokemonNumberText)
        pokemonNumberText.snp.makeConstraints { make in
            make.centerY.equalTo(pokemonNameText)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        view.addSubview(pokemonTypeText)
        pokemonTypeText.snp.makeConstraints { make in
            make.top.equalTo(pokemonNameText.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        view.addSubview(pokemonType2Text)
        pokemonType2Text.snp.makeConstraints { make in
            make.top.equalTo(pokemonNameText.snp.bottom).offset(10)
            make.leading.equalTo(pokemonTypeText.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(guide.snp.centerY).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        view.addSubview(pokemonImage)
        pokemonImage.snp.makeConstraints { make in
            make.top.equalTo(pokemonTypeText.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(containerView.snp.top).offset(20)
        }
        
        containerView.addSubview(aboutText)
        aboutText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalTo(30)
        }
        
        ["Especie", "Altura", "Peso", "Habilidades", "Genero"].forEach{ item in
            
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .semibold)
            label.textColor = UIColor(hex: "#AAABAE")
            label.text = item
            
            stackView.addArrangedSubview(label)
            
        }
        
        containerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(aboutText.snp.bottom).offset(30)
            make.leading.equalTo(aboutText)
            make.height.equalTo(180)
            make.width.equalTo(120)
        }
        
        ["Seed", "1.84", "15.6", "Fuego", "Genero"].forEach{ item in
            
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .semibold)
            label.textColor = UIColor(hex: "#505051")
            label.text = item
            
            stackViewStats.addArrangedSubview(label)
            
        }
        
        containerView.addSubview(stackViewStats)
        stackViewStats.snp.makeConstraints { make in
            make.top.equalTo(aboutText.snp.bottom).offset(30)
            make.leading.equalTo(stackView.snp.trailing).offset(30)
            make.height.equalTo(180)
            make.width.equalTo(120)
        }
        
    }
}
