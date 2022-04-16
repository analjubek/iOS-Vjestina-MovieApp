//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Ana Ljubek on 05.04.2022..
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController{
  
    private var topBarView: TopBarView!
    
    private var searchBarView: SearchBarView!
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        buildConstrints()
    }
    
    private func buildViews(){
        view.backgroundColor = .white
        
        topBarView = TopBarView()
        view.addSubview(topBarView)
        
        searchBarView = SearchBarView()
        view.addSubview(searchBarView)
    }
    
    private func buildConstrints(){
        topBarView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        searchBarView.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
