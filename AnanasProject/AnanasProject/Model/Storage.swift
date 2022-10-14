//
//  Storage.swift
//  PageViewController_dz_20
//
//  Created by Анастасия Козлова on 13.10.2022.
//
import Foundation

/// Хранилище названия изображений и текст лейблов
class Storage {
    
    static let shared = Storage()
    
    let images = ["pag1", "pag2", "pag3"]
    
    let firstText = ["Track Your Cycle",
                     "Plan Your Pregnancy",
                     "Daily Health Insight"]
    
    let secondText = ["Period tracker apps can help you keep up with your flow and cycle.",
                      "Track your menstrual cycle with Clue",
                      "Track your period, cycle, fertility, or any method that affects your cycle."]
    
    private init() {}
}
