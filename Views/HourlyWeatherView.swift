//
//  HourlyWeatherView.swift
//  WeatherApp_ViktarCharniak
//
//  Created by Viktar Charniak on 5/10/24.
//

import UIKit
import SnapKit

final class HourlyWeatherView: UIView {
    struct InputData {
        let hour: String
        let symbol: UIImage?
        let temp: Int
    }

    private let hourlyScrollView = UIScrollView()
    private let hourlyStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHourlyScrollView()
        setupHourlyStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(_ models: [InputData]) {
        models.enumerated().forEach {
            index, model in
            let view = HourlyWeatherView()
                view.setup(model)
                hourlyStackView.addArrangedSubview(view)
            
            if index == 0 {
                hourlyStackView.setCustomSpacing(40, after: view)
            }
        }
    }

    private func setupHourlyScrollView() {
        addSubview(hourlyScrollView)
        hourlyScrollView.showsHorizontalScrollIndicator = false

        hourlyScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupHourlyStackView() {
        hourlyScrollView.addSubview(hourlyStackView)
        hourlyStackView.spacing = 15
        hourlyStackView.distribution = .fillEqually

        hourlyStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension HourlyWeatherView {
    final class HourlyWeatherView: UIView {

        private let stackView = UIStackView()
        private let hourLabel = UILabel()
        private let symbolView = UIImageView()
        private let tempLabel = UILabel()

        override init(frame: CGRect) {
            super.init(frame: frame)

            setupStackView()
            setupHourLabel()
            setupSymbolView()
            setupTempLabel()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func setup(_ model: InputData) {
            hourLabel.text = model.hour
            symbolView.image = model.symbol
            tempLabel.text = "\(model.temp)º"
        }

        private func setupStackView() {
            addSubview(stackView)
            stackView.axis = .vertical
            stackView.spacing = 16
            stackView.distribution = .fillEqually

            stackView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }

        private func setupHourLabel() {
            stackView.addArrangedSubview(hourLabel)
            hourLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            hourLabel.textAlignment = .center
            hourLabel.textColor = .white
        }

        private func setupSymbolView() {
            stackView.addArrangedSubview(symbolView)
            symbolView.contentMode = .scaleAspectFit
        }

        private func setupTempLabel() {
            stackView.addArrangedSubview(tempLabel)
            tempLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            tempLabel.textAlignment = .center
            tempLabel.textColor = .white
        }
    }
}
    
