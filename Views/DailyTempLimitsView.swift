//
//  DailyTempLimitsView.swift
//  WeatherApp_ViktarCharniak
//
//  Created by Viktar Charniak on 5/10/24.
//

import UIKit
import SnapKit

final class DailyTempLimitsView: UIView {
    struct InputData {
        let weekMinTemp: Double
        let weekMaxTemp: Double
        let dayMinTemp: Double
        let dayMaxTemp: Double
        let currentTemt: Double?
    }

    private let tempLimitsView = UIView()
    private let currentTempView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .gray.withAlphaComponent(0.5)
        layer.cornerRadius = 3

        snp.makeConstraints { make in
            make.height.equalTo(6)
        }

        setupTempLimitsView()
        setupCurrentTempView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup( _ model: InputData) {
        let weekTempDiff = model.weekMaxTemp - model.weekMinTemp
        let minOffSet = abs(model.weekMinTemp - model.dayMinTemp) / weekTempDiff
        let maxOffSet = abs(model.weekMaxTemp - model.dayMaxTemp) / weekTempDiff

        tempLimitsView.snp.remakeConstraints { make in
            make.trailing.equalToSuperview().multipliedBy(1 - maxOffSet)
            make.width.equalToSuperview().multipliedBy(1 - minOffSet - maxOffSet)
            make.height.equalToSuperview()
        }

        if let currentTemt = model.currentTemt {
            let currentTempOffSet = abs(model.weekMinTemp - (currentTemt)) / weekTempDiff

            if currentTempOffSet == 0 {
                currentTempView.snp.remakeConstraints { make in
                    make.centerX.equalTo(snp.leading)
                    make.size.equalTo(snp.height)
                }
            }
            else {
                currentTempView.snp.remakeConstraints { make in
                    make.centerX.equalTo(snp.trailing).multipliedBy(currentTempOffSet)
                    make.size.equalTo(snp.height)
                }
            }
        }
    }

    private func setupTempLimitsView() {
        addSubview(tempLimitsView)

        tempLimitsView.backgroundColor = .yellow
        tempLimitsView.layer.borderWidth = 1
        tempLimitsView.layer.cornerRadius = 3

        tempLimitsView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
    }

    private func setupCurrentTempView() {
        addSubview(currentTempView)

        currentTempView.backgroundColor = .white
        currentTempView.layer.borderWidth = 1
        currentTempView.layer.cornerRadius = 3

        currentTempView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(snp.height)
        }
    }
}
