//
//  PokemonListCell.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 11/07/23.
//

import UIKit
import SnapKit

class PokemonListCell: UICollectionViewCell {
    
    var containerView : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let imgPokemon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let stackView : UIStackView = {
        let stackview = UIStackView()
        stackview.backgroundColor = .white.withAlphaComponent(0.2)
        stackview.clipsToBounds = true
        stackview.layer.cornerRadius = 10
        stackview.axis = .horizontal
        stackview.distribution = .fill
        return stackview
    }()
    
    let pokemonNumber : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let pokemonName : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        pokemonNumber.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
        
        stackView.addArrangedSubview(pokemonNumber)
        stackView.addArrangedSubview(pokemonName)
        
        containerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(23)
        }
        
        contentView.addSubview(imgPokemon)
        imgPokemon.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.bottom.equalTo(stackView.snp.top).offset(-5)
        }
        
    }
    
    func config(id: Int){
        containerView.backgroundColor = .random()
        imgPokemon.image = #imageLiteral(resourceName: "chari")
        pokemonName.text = "Charizard"
        pokemonNumber.text = "#" + String(format: "%03d", id + 1)
    }
    
}
