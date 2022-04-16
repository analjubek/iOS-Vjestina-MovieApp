//
//  SectionCollectionViewCell.swift
//  MovieApp
//
//  Created by Ana Ljubek on 16.04.2022..
//

import SnapKit
import UIKit

class SectionCollectionViewCell: UICollectionViewCell{
    
    private var mainView: UIView!
    private var titleLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews(){
        mainView = UIView()
        addSubview(mainView)
        
        titleLabel = UILabel()
        titleLabel.textColor = .hexStringToUIColor(hex: "#0B253F")

        titleLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 20)
        titleLabel.text = "What's popular?"
        mainView.addSubview(titleLabel)
    }
    
    func buildConstraints(){
        mainView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints(){
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(30)
        }
    }
}
