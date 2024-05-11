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
    private let titleContainer = UIView()
    private let titleView = TitleView()
    private let bottomBarView = BottomBarView()
    
    private let tempContentView = UIView()
    private let dailyTempLimitsView = DailyTempLimitsView()
    private let hourlyWeatherView = HourlyWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupScreenImage()
        setupTitleContainer()
        setupTitleView()
        setupBottomBarView()
        
        setupTempContentView()
        setupDayTempView()
        setupDayWeatherView()
    }
    
    private func setupScreenImage() {
        view.addSubview(screenImage)
        screenImage.contentMode = .scaleAspectFill
        screenImage.image = UIImage(named: "Sky")
        
        screenImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTitleContainer() {
        view.addSubview(titleContainer)
        
        titleContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(titleContainer.snp.width).multipliedBy(0.5)
        }
    }
    
    private func setupTitleView() {
        titleContainer.addSubview(titleView)
        titleView.setup(TitleView.InputData(
            title: "Current location",
            subtitle: "PHILADELPHIA",
            currentTemp: 72,
            condition: "Sunny",
            minTemp: 60,
            maxTemp: 75
            )
        )
        
        titleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    private func setupBottomBarView() {
        view.addSubview(bottomBarView)
        
        bottomBarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(50)
            make.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setupTempContentView() {
        view.addSubview(tempContentView)
        
        tempContentView.backgroundColor = .black.withAlphaComponent(0.5)
        tempContentView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        tempContentView.layer.borderWidth = 1
        tempContentView.layer.cornerRadius = 15
        
        tempContentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(titleContainer.snp.bottom).offset(20)
        }
    }
    
    private func setupDayTempView() {
        tempContentView.addSubview(dailyTempLimitsView)
        
        dailyTempLimitsView.setup(
            DailyTempLimitsView.InputData(
                weekMinTemp: 58,
                weekMaxTemp: 77,
                dayMinTemp: 60,
                dayMaxTemp: 75,
                currentTemt: 65
            )
        )
        dailyTempLimitsView.snp.makeConstraints {make in
            make.top.leading.equalToSuperview().inset(10)
            make.width.equalToSuperview().inset(10)
        }
    }
    
    private func setupDayWeatherView() {
        tempContentView.addSubview(hourlyWeatherView)
        
        hourlyWeatherView.setup( [
            HourlyWeatherView.InputData(
                hour: "Now",
                symbol: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 63),
            
            HourlyWeatherView.InputData(
                hour: "1pm",
                symbol: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 64),
            
            HourlyWeatherView.InputData(
                hour: "2pm",
                symbol: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 65),
            
            HourlyWeatherView.InputData(
                hour: "3pm",
                symbol: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 65),
            
            HourlyWeatherView.InputData(
                hour: "4pm",
                symbol: UIImage(systemName: "cloud.sun.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 64),
            
            HourlyWeatherView.InputData(
                hour: "5pm",
                symbol: UIImage(systemName: "cloud.sun.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 63),
            
            HourlyWeatherView.InputData(
                hour: "6pm",
                symbol: UIImage(systemName: "cloud.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 62),
           
            HourlyWeatherView.InputData(
                hour: "7pm",
                symbol: UIImage(systemName: "cloud.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 62),
            
            HourlyWeatherView.InputData(
                hour: "8pm",
                symbol: UIImage(systemName: "cloud.rain.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 61),
            
            HourlyWeatherView.InputData(
                hour: "9pm",
                symbol: UIImage(systemName: "cloud.rain.fill")?.withRenderingMode(.alwaysOriginal),
                temp: 60),
        ])
        
        hourlyWeatherView.snp.makeConstraints { make in
            make.top.equalTo(dailyTempLimitsView.snp.bottom).offset(16)
            make.bottom.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
    }
}
