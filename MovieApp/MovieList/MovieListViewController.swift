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
    
    private var movieAsGridController: MovieAsGridController!
    private var movieAsListController: MovieAsListController!
    
    private var controllerView: UIView!
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViewControllers()
        buildViews()
        buildConstrints()
    }
    
    private func buildViewControllers() {
        movieAsGridController = MovieAsGridController()
        addChild(movieAsGridController)
        
        movieAsListController = MovieAsListController()
        addChild(movieAsListController)
    }
    
    private func buildViews(){
        view.backgroundColor = .white
        
        topBarView = TopBarView()
        view.addSubview(topBarView)
        
        searchBarView = SearchBarView()
        view.addSubview(searchBarView)
        
        controllerView = UIView()
        view.addSubview(controllerView)
        //controllerView.addSubview(movieAsGridController.view)
        controllerView.addSubview(movieAsListController.view)
    }
    
    private func buildConstrints(){
        topBarView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        searchBarView.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(43)
        }
        controllerView.snp.makeConstraints{
            $0.top.equalTo(searchBarView.snp.bottom).inset(-40)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        /*movieAsGridController.view.snp.makeConstraints{
            $0.edges.equalTo(controllerView.snp.edges)
        }*/
        movieAsListController.view.snp.makeConstraints{
            $0.edges.equalTo(controllerView.snp.edges)
        }
    }
}
