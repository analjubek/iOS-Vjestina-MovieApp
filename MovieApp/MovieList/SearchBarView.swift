//
//  SearchBarView.swift
//  MovieApp
//
//  Created by Ana Ljubek on 15.04.2022..
//

/*
import UIKit
import SnapKit

class SearchBarView: UIView{
    
    private var mainView: UIStackView!
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
        mainView = UIStackView()
        mainView.spacing = 10
        addSubview(mainView)
        
        searchBarView = UIView()
        mainView.addArrangedSubview(searchBarView)
        
        searchBarView.backgroundColor = UIColor.hexStringToUIColor(hex: "#EAEAEB")
        searchBarView.layer.cornerRadius = 10
        
        let searchImage = UIImage(named: "search-icon")
        searchImageView = UIImageView(image: searchImage)
        searchBarView.addSubview(searchImageView)
        
        searchTextField = UITextField()
        searchTextField.placeholder = "Search"
        searchTextField.textColor = UIColor.hexStringToUIColor(hex: "#0B253F")
        searchTextField.font = UIFont(name: "Futura", size: 16)
        searchTextField.addTarget(self, action: #selector(textFieldPressed), for: .editingChanged)
        searchBarView.addSubview(searchTextField)
        
        xButton = UIButton()
        let xImage = UIImage(named: "close")
        xButton.setImage(xImage, for: .normal)
        xButton.isHidden = true
        xButton.addTarget(self, action: #selector(xButtonPressed), for: .touchUpInside)
        searchBarView.addSubview(xButton)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.isHidden = true
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        mainView.addArrangedSubview(cancelButton)
    }
    
    func searchBarConstraints(){
        mainView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        searchBarView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(22)
            $0.leading.trailing.equalTo(mainView.safeAreaLayoutGuide).inset(18)
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
            $0.width.equalTo(searchBarView.snp.width).offset(43)
        }
        xButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(17)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.width.equalTo(11.5)
        }
        cancelButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(33)
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    
    @objc
    func textFieldPressed(textField: UITextField){
        let text = textField.text
        
        if (text != ""){
            xButton.isEnabled = true
            xButton.isUserInteractionEnabled = true
            xButton.isHidden = false
        }
        
        cancelButton.isEnabled = true
        cancelButton.isUserInteractionEnabled = true
        cancelButton.isHidden = false
    }
    
    @objc
    func xButtonPressed(){
        cancelButton.isEnabled = true
        cancelButton.isUserInteractionEnabled = true
        cancelButton.isHidden = false
        
        xButton.isHidden = true
        
        searchTextField.text = ""
        searchTextField.endEditing(false)
    }
    
    @objc
    func cancelButtonPressed(){
        cancelButton.isHidden = true
        xButton.isHidden = true
        
        searchTextField.text = ""
        searchTextField.endEditing(true)
    }
}
*/
