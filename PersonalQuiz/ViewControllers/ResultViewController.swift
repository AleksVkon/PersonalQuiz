//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answersChosen = [Answer]()
    private var animalCount = [Animal: Int]()
    private var animal: Animal = .cat
    
    @IBOutlet var resultLabelEmoji: UILabel!
    @IBOutlet var resultLabelText: UILabel!
    
    
//    let mostFrequentAnimal = animalCounts.max(by: { $0.value < $1.value })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        for answer in answersChosen {
            animalCount[answer.animal, default: 0] += 1
        }
        
        if let mostFrequentAnimal = animalCount.max(by: { $0.value < $1.value }) {
            if let animal = Animal(rawValue: mostFrequentAnimal.key.rawValue) {
                resultLabelEmoji.text = "Вы - \(animal.rawValue)"
                resultLabelText.text = "\(animal.definition)"
            }
        }
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
