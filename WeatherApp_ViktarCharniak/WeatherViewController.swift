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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        setupScreenImage()
        setupTitleConteiner()
        setupTitleView()
        
    }

    private func setupScreenImage() {
        view.addSubview(screenImage)
        screenImage.contentMode = .scaleAspectFill
        screenImage.image = UIImage(named: "Sky")
        
        screenImage.snp.makeConstraints {make in
            make.edges.equalToSuperview()
        }
        
    }

    private func setupTitleConteiner() {
        view.addSubview(titleConteiner)
    }
    
    private func setupTitleView() {
        view.addSubview(titleView)
    }
        
    
}
