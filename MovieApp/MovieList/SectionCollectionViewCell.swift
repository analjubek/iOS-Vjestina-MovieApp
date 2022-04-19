//
//  SectionCollectionViewCell.swift
//  MovieApp
//
//  Created by Ana Ljubek on 16.04.2022..
//

import SnapKit
import UIKit
import MovieAppData

class SectionCollectionViewCell: UICollectionViewCell{
    private var sectionViewsContainer: UIView!
    private var titleLabel: UILabel!
    
    private var sectionMovieGroup: MovieGroup!
    
    private var filterScrollView: UIScrollView!
    private var filterContentView: UIView!
    private var filterStackView: UIStackView!
    
    private var movieCollectionViewLayout: UICollectionViewLayout!
    private var movieCollectionView: UICollectionView!
    
    let cellIdentifier = "cellId"
    
    private var cellMoviesGroup: MovieGroup!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews(){
        sectionViewsContainer = UIView()
        addSubview(sectionViewsContainer)
        
        titleLabel = UILabel()
        titleLabel.textColor = .hexStringToUIColor(hex: "#0B253F")
        titleLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 20)
        sectionViewsContainer.addSubview(titleLabel)
        
        filterScrollView = UIScrollView()
        sectionViewsContainer.addSubview(filterScrollView)
        
        filterContentView = UIView()
        filterScrollView.addSubview(filterContentView)
        
        filterStackView = UIStackView()
        filterStackView.axis = .horizontal
        filterStackView.alignment = .fill
        filterStackView.distribution = .fillProportionally
        filterStackView.spacing = 20
        filterContentView.addSubview(filterStackView)
        
        movieCollectionView.register(MoviesCell.self, forCellWithReuseIdentifier: cellIdentifier)
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        sectionViewsContainer.addSubview(movieCollectionView)
    }
    
    func buildConstraints(){
        sectionViewsContainer.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints(){
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(30)
        }
        //error jer nema bottom?
        filterContentView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(30)
        }
        filterStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        filterScrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        movieCollectionView.snp.makeConstraints{
            $0.top.equalTo(filterStackView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(18)
            $0.trailing.bottom.equalToSuperview()
        }
    }
    
    func set(movieGroup: MovieGroup){
        cellMoviesGroup = movieGroup
        
        switch movieGroup {
            case .popular:
                titleLabel.text = "What's popular"
            case .freeToWatch:
                titleLabel.text = "Free to Watch"
            case .trending:
                titleLabel.text = "Trending"
            case .topRated:
                titleLabel.text = "Top Rated"
            case .upcoming:
                titleLabel.text = "Upcoming"
        }
    }
}


extension SectionCollectionViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let movies = Movies.all()
        
        return movies.filter({$0.group.contains(cellMoviesGroup)}).count

    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MoviesCell
        
        let movies = Movies.all()
        
        cell.set(movie: movies.filter{$0.group.contains(cellMoviesGroup)}.sorted(by: {$0.title > $1.title})[indexPath.row])

        return cell
    }
}
extension SectionCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // Logic when cell is selected
    }
}

extension SectionCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = collectionView.frame.width
        let heightSize = CGFloat(122)
        
        return CGSize(width: widthSize, height: heightSize)
    }
}


