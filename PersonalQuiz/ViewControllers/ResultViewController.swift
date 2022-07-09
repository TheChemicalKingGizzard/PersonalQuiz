//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var animalDescription: UILabel!
    
    //MARK: - Public Properties
    var answersChosen: [Answer] = []
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        prepareResult()
    }
    
    //MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    //MARK: - Private Methods
    private func calculateAnswer() -> Animal{
        var resultList: [Animal : Int] = [.dog : 0,
                                          .cat : 0,
                                          .rabbit : 0,
                                          .turtle : 0]
        
        for answer in answersChosen {
            switch answer.animal {
            case .dog: resultList[.dog]! += 1
            case .cat: resultList[.cat]! += 1
            case .rabbit: resultList[.rabbit]! += 1
            case .turtle: resultList[.turtle]! += 1
            }
        }
        return resultList.sorted(by: {$0.1 > $1.1}).first!.key
    }
    
    private func prepareResult() {
        resultTitle.text = "Вы - \(calculateAnswer().rawValue)!"
        animalDescription.text = "\(calculateAnswer().definition)"
    }
}
