//
//  MovieAsGridContoller.swift
//  MovieApp
//
//  Created by Ana Ljubek on 16.04.2022..
//

import UIKit
import SnapKit
import MovieAppData

class MovieAsGridController: UIViewController{
    
    private var flowLayout: UICollectionViewFlowLayout!
    public var collectionView: UICollectionView!
    
    private var sectionCell: SectionCollectionViewCell!
    
    let cellIdentifier = "cellId"
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
    }
    
    private func buildViews() {
        view.backgroundColor = .white
        
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        
        collectionView.register(SectionCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func buildConstraints(){
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
}


extension MovieAsGridController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var movieGroupSet = Set<MovieGroup>()
        let movies = Movies.all()
        
        movies.map{$0.group}.flatMap{$0}.forEach{movieGroupSet.insert($0)}
        
        return movieGroupSet.count
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SectionCollectionViewCell
        //cell.backgroundColor = .yellow
        
        //??????????
        let groupArray = [MovieGroup.popular, MovieGroup.freeToWatch, MovieGroup.trending, MovieGroup.topRated, MovieGroup.upcoming]
        
        cell.set(movieGroup: groupArray[indexPath.row])
        
        return cell
    }
}
extension MovieAsGridController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // Logic when cell is selected
    }
}

extension MovieAsGridController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = collectionView.frame.width
        let heightSize = CGFloat(view.frame.height/2)
        
        return CGSize(width: widthSize, height: heightSize)
    }
}

