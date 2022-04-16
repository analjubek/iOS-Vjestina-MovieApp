//
//  MovieAsGridContoller.swift
//  MovieApp
//
//  Created by Ana Ljubek on 16.04.2022..
//

import UIKit
import SnapKit

class MovieAsGridController: UIViewController{
    
    //public var collectionView: UICollectionView!
    //private var collectionViewLayout: UICollectionViewLayout!
    public var flowLayout: UICollectionViewFlowLayout!
    public var collectionView: UICollectionView!
    
    
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
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
}


extension MovieAsGridController: UICollectionViewDataSource {
func numberOfSections(in collectionView: UICollectionView) -> Int {
return 1
}
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return 10
}
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
UICollectionViewCell {
let cell = collectionView.dequeueReusableCell(
withReuseIdentifier: cellIdentifier,
for: indexPath)
cell.backgroundColor = .blue
return cell
}
}
extension MovieAsGridController: UICollectionViewDelegate {
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
// Logic when cell is selected
}
}

extension MovieAsGridController: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
let row = indexPath.row + 1
return CGSize(width: row * 10, height: row * 10)
}
}
