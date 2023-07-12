//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Eduardo Martinez Ibarra on 11/07/23.
//

import UIKit
import SnapKit

class PokemonListView: UIViewController {
    
    private let blueHeader: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "2B72B9")
        return view
    }()
    
    private let imgPokeball: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "Pokeball")
        return imageView
    }()
    
    private let questionText: UILabel = {
        let label = UILabel()
        label.text = "¿Qué pokemon estas\nbuscando?"
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let searchPokemonText: UILabel = {
        let label = UILabel()
        label.text = "Busca un pokemon por su nombre o\nusando su número de pokedex"
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let searchBar : UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "Buscar Pokémon"
        searchbar.backgroundImage = UIImage()
        searchbar.searchTextField.textColor = .white
        searchbar.searchTextField.backgroundColor = .white
        searchbar.searchTextField.layer.cornerRadius = 18
        searchbar.searchTextField.layer.masksToBounds = true
        return searchbar
    }()
    
    private let gridModeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "grid")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(hex: "2B72B9")
        return button
    }()
    
    private let listModeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "list")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(hex: "D0D5DD")
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    var listMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " "
        view.backgroundColor = .white
    
        collectionView.register(PokemonListCell.self, forCellWithReuseIdentifier: "PokemonListCell")
        collectionView.dataSource = self
        collectionView.delegate = self
              
        setupUI()
        
        collectionView.reloadData()
    }
    
    func setupUI(){
        
        view.addSubview(blueHeader)
        blueHeader.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(219)
        }
        
        blueHeader.addSubview(imgPokeball)
        imgPokeball.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalTo(10)
            make.height.width.equalTo(170)
        }
        
        blueHeader.addSubview(questionText)
        questionText.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.leading.equalTo(16)
        }
        
        blueHeader.addSubview(searchPokemonText)
        searchPokemonText.snp.makeConstraints { make in
            make.top.equalTo(questionText.snp.bottom).offset(10)
            make.leading.equalTo(16)
        }
        
        blueHeader.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(searchPokemonText.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(45)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        view.addSubview(listModeButton)
        listModeButton.snp.makeConstraints { make in
            make.top.equalTo(blueHeader.snp.bottom).offset(10)
            make.trailing.equalTo(view).offset(-12)
            make.height.width.equalTo(20)
        }
        
        view.addSubview(gridModeButton)
        gridModeButton.snp.makeConstraints { make in
            make.top.equalTo(blueHeader.snp.bottom).offset(10)
            make.trailing.equalTo(listModeButton.snp.leading).offset(-12)
            make.height.width.equalTo(20)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(gridModeButton.snp.bottom).offset(10)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        listModeButton.addTarget(self, action: #selector(listModeButtonDidTap), for: .touchUpInside)
        gridModeButton.addTarget(self, action: #selector(gridModeButtonnDidTap), for: .touchUpInside)
                
    }
    
    @objc func listModeButtonDidTap(){
        listMode = true
        listModeButton.tintColor = UIColor(hex: "2B72B9")
        gridModeButton.tintColor = UIColor(hex: "D0D5DD")
        collectionView.reloadData()
    }
    
    @objc func gridModeButtonnDidTap(){
        listMode = false
        gridModeButton.tintColor = UIColor(hex: "2B72B9")
        listModeButton.tintColor = UIColor(hex: "D0D5DD")
        collectionView.reloadData()
    }
    
}
extension PokemonListView: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if listMode{
            
            let size = (view.frame.size.width - 40)
            let height = (collectionView.frame.size.height - 50) / 4
            
            return CGSize(width: size, height: height)
            
        }else{
            
            let size = (view.frame.size.width - 60) / 2.0
            let height = (collectionView.frame.size.height - 50) / 4
            
            return CGSize(width: size, height: height)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
}

extension PokemonListView: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonListCell", for: indexPath) as! PokemonListCell
        cell.config(id:indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PokemonDetailView()
        vc.navigationItem.backButtonTitle = " "
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

