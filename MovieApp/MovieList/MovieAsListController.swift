//
//  MovieAsListController.swift
//  MovieApp
//
//  Created by Ana Ljubek on 18.04.2022..
//

import UIKit
import SnapKit
import MovieAppData

class MovieAsListController: UIViewController{
    
    private var collectionViewLayout: UICollectionViewFlowLayout!
    private var collectionView: UICollectionView!
    
    let cellIdentifier = "cellId"
    
    var searchBarText = "Iron Man"
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        addConstraints()
    }
    
    func buildViews(){
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 15
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        view.addSubview(collectionView)
        
        collectionView.register(MovieAsListCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func addConstraints(){
        collectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(18)
        }
    }
}

extension MovieAsListController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let movies = Movies.all()
        
        return movies.filter({$0.title.lowercased().contains(searchBarText.lowercased())}).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MovieAsListCell

        let movies = Movies.all()
        
        let movie = movies.filter({$0.title.lowercased().contains(searchBarText)}).sorted(by: {$0.title > $1.title})[indexPath.row]
        
        cell.set(movie: movie)
        
        return cell
    }
}


extension MovieAsListController: UICollectionViewDelegate{
    // Logic when cell is selected
}

extension MovieAsListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemWidth = collectionView.frame.width - 36
            let itemHeight = CGFloat(142)
            
            return CGSize(width: itemWidth, height: itemHeight)
    }
}
