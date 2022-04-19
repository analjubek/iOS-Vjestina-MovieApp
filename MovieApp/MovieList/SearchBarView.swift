//
//  SearchBarView.swift
//  MovieApp
//
//  Created by Ana Ljubek on 15.04.2022..
//


import UIKit
import SnapKit

class SearchBarView: UIView{
    
    //private var mainView: UIStackView!
    private var mainView: UIView!
    private var searchBarView: UIView!
    
    private var searchImageView: UIImageView!
    private var searchTextField: UITextField!
    private var xButton: UIButton!
    private var cancelButton: UIButton!
    
    init(){
        super.init(frame: .zero)
        
        createSearchBar()
        searchBarConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSearchBar(){
        mainView = UIView()
        addSubview(mainView)
        
        searchBarView = UIView()
        mainView.addSubview(searchBarView)
        
        searchBarView.backgroundColor = UIColor.hexStringToUIColor(hex: "#EAEAEB")
        searchBarView.layer.cornerRadius = 10
        
        let searchImage = UIImage(named: "search-icon")
        searchImageView = UIImageView(image: searchImage)
        searchBarView.addSubview(searchImageView)
        
        searchTextField = UITextField()
        searchTextField.placeholder = "Search"
        searchTextField.textColor = UIColor.hexStringToUIColor(hex: "#0B253F")
        searchTextField.font = UIFont(name: "Futura", size: 16)
        searchBarView.addSubview(searchTextField)
    }
    
    func searchBarConstraints(){
        mainView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        searchBarView.snp.makeConstraints{
            $0.top.equalTo(mainView.snp.bottom).inset(22)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(43)
        }
        searchImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(11)
            $0.height.width.equalTo(20)
        }
        searchTextField.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalTo(searchImageView.snp.trailing).offset(11)
            $0.height.equalTo(19)
            $0.width.equalTo(searchBarView.snp.width).inset(30)
        }
    }
}

