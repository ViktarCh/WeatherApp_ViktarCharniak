//
//  BottomBarView.swift
//  WeatherApp_ViktarCharniak
//
//  Created by Viktar Charniak on 5/5/24.
//

import UIKit
import SnapKit

final class BottomBarView: UIView {
    
    private let deviderView = UIView()
    private let cityListButton = UIButton()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray.withAlphaComponent(0.2)
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 15
        
        setupDeviderView()
        setupCityListButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDeviderView() {
        addSubview(deviderView)
        deviderView.backgroundColor = .gray.withAlphaComponent(0.5)
        
        deviderView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    private func setupCityListButton() {
        addSubview(cityListButton)
        cityListButton.setImage(UIImage(systemName: "list.dash"), for: .normal)
        cityListButton.setTitleColor(.white, for: .normal)
        cityListButton.tintColor = .white
        
        cityListButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(50)
        }
    }
}
