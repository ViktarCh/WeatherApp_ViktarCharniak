//
//  TitleView.swift
//  WeatherApp_ViktarCharniak
//
//  Created by Viktar Charniak on 5/5/24.
//

import UIKit
import SnapKit

final class TitleView: UIView {
    struct InputData {
            let title: String
            let subtitle: String
            let currentTemp: Int
            let condition: String
            let minTemp: Int
            let maxTemp: Int
    }
    
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let currentTempLabel = UILabel()
    private let conditionLabel = UILabel()
    private let tempLimitsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
        setupTitleLabel()
        setupSubtitleLabel()
        setupCurrentTempLabel()
        setupConditionLabel()
        setupTempLimitslabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ model: InputData) {
            titleLabel.text = model.title
            subtitleLabel.text = model.subtitle
            subtitleLabel.isHidden = model.subtitle == nil
            currentTempLabel.text = "\(model.currentTemp)º"
            conditionLabel.text = model.condition
            tempLimitsLabel.text = "Min: \(model.minTemp)º, Max: \(model.maxTemp)º"
        }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        
        stackView.snp.makeConstraints {make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
    }
    
    private func setupSubtitleLabel() {
        stackView.addArrangedSubview(subtitleLabel)
        subtitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        subtitleLabel.textColor = .white
        subtitleLabel.textAlignment = .center
    }
    
    private func setupCurrentTempLabel() {
        stackView.addArrangedSubview(currentTempLabel)
        currentTempLabel.font = UIFont.systemFont(ofSize: 90, weight: .bold)
        currentTempLabel.textColor = .white
        currentTempLabel.textAlignment = .center
    }
    
    private func setupConditionLabel() {
        stackView.addArrangedSubview(conditionLabel)
        conditionLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        conditionLabel.textAlignment = .center
        conditionLabel.textColor = .white
    }
    
    private func setupTempLimitslabel() {
        stackView.addArrangedSubview(tempLimitsLabel)
        tempLimitsLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        tempLimitsLabel.textAlignment = .center
        tempLimitsLabel.textColor = .white
    }
}
