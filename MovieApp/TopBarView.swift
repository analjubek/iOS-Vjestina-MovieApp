//
//  TopBarView.swift
//  MovieApp
//
//  Created by Ana Ljubek on 15.04.2022..
//

import UIKit
import SnapKit

class TopBarView: UIView{
    var topBarView: UIView!
    var logoImageView: UIImageView!
    
    init(){
        super.init(frame: .zero)
        
        createTopBar()
        buildTopBarConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTopBar(){
        topBarView = UIView()
        addSubview(topBarView)
        
        topBarView.backgroundColor = UIColor.hexStringToUIColor(hex: "#0B253F")
        
        let logoImage = UIImage(named: "logo")
        logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        
        topBarView.addSubview(logoImageView)
    }

    func buildTopBarConstraints(){
        topBarView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        logoImageView.snp.makeConstraints{
            $0.centerX.equalTo(topBarView)
            $0.bottom.equalTo(topBarView).inset(7)
            $0.height.equalTo(35)
            $0.width.equalTo(143)
        }
    }
}
