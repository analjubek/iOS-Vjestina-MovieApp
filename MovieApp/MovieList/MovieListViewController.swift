//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Ana Ljubek on 05.04.2022..
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController, UITextFieldDelegate{
    //top bar
    private var topBarView: TopBarView!
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        defineLayoutForViews()
    }
    
    private func buildViews(){
        view.backgroundColor = .white
        topBarView = TopBarView()
        
        view.addSubview(topBarView)
    }
    
    private func defineLayoutForViews(){
        topBarConstraints()
    }
    
    private func topBarConstraints(){
        topBarView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
}
