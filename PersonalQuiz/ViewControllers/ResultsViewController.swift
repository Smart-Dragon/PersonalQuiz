//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 11.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

final class ResultsViewController: UIViewController {

    // MARK: - IBActions
    
    @IBOutlet weak var animalTitle: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    // MARK: - Public Properties
    
    public var answers: [Answer] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setHidesBackButton(true, animated: false)
        showResult(type: getResultAnimalType())
    }
    
    // MARK: - Private Methods
    
    private func getResultAnimalType() -> AnimalType {
        var counts: [AnimalType : Int] = [:]
        for answer in answers {
            counts[answer.type] = (counts[answer.type] ?? 0) + 1
        }
        let animalCounts = counts.sorted { $0.1 > $1.1 }
        
        // unwrap осознанный по заданию ответы точно будут.
        // могут быть равные результеты, но их обработка не требовалась
        return animalCounts.first!.key
    }

    private func showResult(type: AnimalType) {
        animalTitle.text = String(type.rawValue)
        animalDescription.text = type.difinition
    }
    
}
