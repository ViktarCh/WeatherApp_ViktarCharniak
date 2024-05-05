//
//  WeatherViewController.swift
//  WeatherApp_ViktarCharniak
//
//  Created by Viktar Charniak on 5/5/24.
//

import UIKit
import SnapKit

final class WeatherViewController: UIViewController {
    
    private let screenImage = UIImageView()
    private let titleConteiner = UIView()
    private let titleView = UIView()
    private let bottomBarView = BottomBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        setupScreenImage()
        setupTitleConteiner()
        setupTitleView()
        setupBottomBarView()
    }

    private func setupScreenImage() {
        view.addSubview(screenImage)
        screenImage.contentMode = .scaleAspectFill
        screenImage.image = UIImage(named: "Sky")

        screenImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupTitleConteiner() {
        view.addSubview(titleConteiner)
        
        titleConteiner.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(titleConteiner.snp.width).multipliedBy(0.5)
        }
    }
    
    private func setupTitleView() {
        view.addSubview(titleView)
        titleView.setup(
            TitleView.InputModel(title: "Current location",
                                 subtitle: "Philadelphia",
                                 currentTemp: 65,
                                 Condition: "Sunny",
                                 minTemp: 60,
                                 maxtemp: 70)
        )
        
        titleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    private let setupBottomBarView() {
        view.addSubview(bottomBarView)
        
        bottomBarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(50)
            make.bottom.horizontalEdges.equalToSuperview()
        }
    }
}
