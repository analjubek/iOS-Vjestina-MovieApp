//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Ana Ljubek on 05.04.2022..
//

import Foundation
import UIKit
import SnapKit
import SwiftUI

class MovieListViewController: UIViewController, UITextFieldDelegate{
    //topBar
    private var topBarView: UIView!
    private var logoImageView: UIImageView!
    
    //searchBar
    private var searchBarView: UIView!
    private var searchImageView: UIImageView!
    private var searchTextField: UITextField!
    private var xButton: UIButton!
    private var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createViews()
        defineLayoutForViews()
    }
    
    private func createViews(){
        createTopBar()
        
        createSearchBar()
    }
    
    private func defineLayoutForViews(){
        topBarConstraints()
        
        searchBarConstraints()
    }
    
    private func createTopBar(){
        topBarView = UIView()
        
        topBarView.backgroundColor = UIColor.hexStringToUIColor(hex: "#0B253F")
        
        let logoImage = UIImage(named: "logo")
        logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        
        topBarView.addSubview(logoImageView)
        
        view.addSubview(topBarView)
    }
    
    private func topBarConstraints(){
        topBarView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        logoImageView.snp.makeConstraints{
            $0.centerX.equalTo(topBarView)
            $0.bottom.equalTo(topBarView).inset(7)
            $0.height.equalTo(35)
            $0.width.equalTo(143)
        }
    }
    
    func createSearchBar(){
        searchBarView = UIView()
        view.addSubview(searchBarView)
        
        searchBarView.backgroundColor = UIColor.hexStringToUIColor(hex: "#EAEAEB")
        searchBarView.layer.cornerRadius = 10
        
        let searchImage = UIImage(named: "search-icon")
        searchImageView = UIImageView(image: searchImage)
        
        searchBarView.addSubview(searchImageView)
        
        
        searchTextField = UITextField()
        searchTextField.placeholder = "Search"
        searchTextField.textColor = UIColor.hexStringToUIColor(hex: "#0B253F")
        searchTextField.font = UIFont(name: "Futura", size: 16)
        searchTextField.delegate = self
        
        searchBarView.addSubview(searchTextField)
    }
    
    
    func searchBarConstraints(){
        searchBarView.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom).offset(22)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
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
            $0.width.equalTo(159)
        }
        
    }
}
