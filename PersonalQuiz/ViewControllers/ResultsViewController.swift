//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 11.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

final class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным

    // MARK: - IBActions
    
    @IBOutlet weak var animalTitle: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    // MARK: - Public Properties
    
    public var answers: [Answer] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setHidesBackButton(true, animated: false)
        
        loadResult(type: getResultAnimalType())
    }
    
    // MARK: - Private Methods
    
    private func getResultAnimalType() -> AnimalType {
        var counts: [AnimalType : Int] = [:]
        for answer in answers {
            counts[answer.type] = (counts[answer.type] ?? 0) + 1
        }
        let animalsCount = counts.sorted { $0.1 > $1.1 }
        
        // unwrap осознанный по заданию ответы точно будут.
        return animalsCount.first!.key
    }

    private func loadResult(type: AnimalType) {
        animalTitle.text = String(type.rawValue)
        animalDescription.text = type.difinition
    }
    
}
