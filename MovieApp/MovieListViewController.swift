//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Ana Ljubek on 05.04.2022..
//

import Foundation

import Foundation
import UIKit
import PureLayout
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
        
        viewsFunc()
        defineLayoutForViews()
    }
    
    private func viewsFunc(){
        topBar()
        
        searchBarFunc()
    }
    
    private func defineLayoutForViews(){
        topBarConstraints()
        
        searchBarConstraints()
    }
    
    private func topBar(){
        topBarView = UIView()
        
        topBarView.backgroundColor = hexStringToUIColor(hex: "#0B253F")
        
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

    func hexStringToUIColor (hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func searchBarFunc(){
        searchBarView = UIView()
        view.addSubview(searchBarView)
        
        searchBarView.backgroundColor = hexStringToUIColor(hex: "#EAEAEB")
        searchBarView.layer.cornerRadius = 10
        
        let searchImage = UIImage(named: "search-icon")
        searchImageView = UIImageView(image: searchImage)
        
        searchBarView.addSubview(searchImageView)
        
        
        searchTextField = UITextField()
        searchTextField.placeholder = "Search"
        searchTextField.textColor = hexStringToUIColor(hex: "#0B253F")
        searchTextField.font = UIFont(name: "Futura", size: 16)
        searchTextField.delegate = self
        
        searchBarView.addSubview(searchTextField)
    }
    
    
    func searchBarConstraints(){
        searchBarView.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom).offset(22)
            //$0.leading.trailing.equalToSuperview().offset(18)
            //$0.leading.trailing.equalTo(18)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            //$0.leading.trailing.equalTo(view.safeAreaInsets).offset(18)
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
