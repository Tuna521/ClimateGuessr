//
//  GameViewController.swift
//  Tutorial - Single View App
//
//  Created by Wang Zong-Ting on 19.02.2021.
//

import UIKit



class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion else{
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer: answer, question: question){
            // correct
            if let index = gameModels.firstIndex(where: {$0.text == question.text}){
                if index < (gameModels.count - 1){
                    // next question
                    let nextQuestion = gameModels[index + 1]
                    configureUI(question: nextQuestion)
                    table.reloadData()
                    
                } else {
                    // end of game
                    let vc = self.storyboard?.instantiateViewController(identifier: "end") as! EndViewController
                    vc.modalPresentationStyle = .fullScreen
                    present(vc, animated: true)
                    
                    //let alert = UIAlertController(title: "Done", message: "You have finished.", preferredStyle: .alert)
                    //alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    //present(alert, animated: true)
                    
                }
            }
        } else {
            // wrong answer
            let alert = UIAlertController(title: "Wrong", message: "Choose another!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }

    var gameModels = [Question]()
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var map: UIImageView!
    
    
    var currentQuestion: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        super.viewDidLayoutSubviews()
        configureUI(question: gameModels.first!)
    }
    private func configureUI(question: Question) {
        label.text = question.text
        currentQuestion = question
        table.delegate = self
        table.dataSource = self
        image.image = UIImage(named: question.lat)
        map.image = UIImage(named: question.lat + "Map")

    }
    
    private func checkAnswer(answer: Answer, question: Question)-> Bool{
        if question.answers.contains(where: {$0.text == answer.text}){
            return answer.correct
        }
        return false
    }
    

    private func setupQuestions(){
        // from https://aqicn.org/here/
        
        gameModels.append(Question(text: "Dehli, India", aqi: 219, lat: "Dehli", lon: 0, answers:[
            Answer(text: "Good", correct: false),
            Answer(text: "Moderate", correct: false),
            Answer(text: "Unhealthy for sensitive group", correct: false),
            Answer(text: "Unhealthy", correct: false),
            Answer(text: "Very Unhealthy", correct: true),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        gameModels.append(Question(text: "London, England", aqi: 25, lat: "London", lon: 0, answers:[
            Answer(text: "Good", correct: true),
            Answer(text: "Moderate", correct: false),
            Answer(text: "Unhealthy for sensitive group", correct: false),
            Answer(text: "Unhealthy", correct: false),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        
        gameModels.append(Question(text: "Tokyo, Japan", aqi: 10, lat: "Tokyo", lon: 0, answers:[
            Answer(text: "Good", correct: true),
            Answer(text: "Moderate", correct: false),
            Answer(text: "Unhealthy for sensitive group", correct: false),
            Answer(text: "Unhealthy", correct: false),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        gameModels.append(Question(text: "Singapore, Respublic of Singapore", aqi: 61, lat: "Singapore", lon: 0, answers:[
            Answer(text: "Good", correct: false),
            Answer(text: "Moderate", correct: true),
            Answer(text: "Unhealthy for sensitive group", correct: false),
            Answer(text: "Unhealthy", correct: false),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        
        gameModels.append(Question(text: "Beijing, China", aqi: 122, lat: "Beijing", lon: 0, answers:[
            Answer(text: "Good", correct: false),
            Answer(text: "Moderate", correct: false),
            Answer(text: "Unhealthy for sensitive group", correct: true),
            Answer(text: "Unhealthy", correct: false),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        
        gameModels.append(Question(text: "Kyiv, Ukraine", aqi: 127, lat: "Kyiv", lon: 0, answers:[
            Answer(text: "Good", correct: false),
            Answer(text: "Moderate", correct: false),
            Answer(text: "Unhealthy for sensitive group", correct: true),
            Answer(text: "Unhealthy", correct: false),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        
        gameModels.append(Question(text: "Krasnoyarsk, Russia", aqi: 182, lat: "Krasnoyarsk", lon: 0, answers:[
            Answer(text: "Good", correct: false),
            Answer(text: "Moderate", correct: false),
            Answer(text: "Unhealthy for sensitive group", correct: false),
            Answer(text: "Unhealthy", correct: true),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        
        gameModels.append(Question(text: "Budapest, Hungary", aqi: 151, lat: "Budapest", lon: 0, answers:[
            Answer(text: "Good", correct: false),
            Answer(text: "Moderate", correct: false),
            Answer(text: "Unhealthy for sensitive group", correct: false),
            Answer(text: "Unhealthy", correct: true),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        
        gameModels.append(Question(text: "Berlin, Germany", aqi: 76, lat: "Berlin", lon: 0, answers:[
            Answer(text: "Good", correct: false),
            Answer(text: "Moderate", correct: true),
            Answer(text: "Unhealthy for sensitive group", correct: false),
            Answer(text: "Unhealthy", correct: false),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
        
        gameModels.append(Question(text: "Madrid, Spain", aqi: 53, lat: "Madrid", lon: 0, answers:[
            Answer(text: "Good", correct: false),
            Answer(text: "Moderate", correct: true),
            Answer(text: "Unhealthy for sensitive group", correct: false),
            Answer(text: "Unhealthy", correct: false),
            Answer(text: "Very Unhealthy", correct: false),
            Answer(text: "Hazardous", correct: false),
        ]
        ))
    }
    

}


struct Question {
    var text: String
    let aqi: Int
    let lat: String     // contains imagename
    let lon: Float
    let answers: [Answer]
    
}

struct Answer {
    let text: String
    let correct: Bool // true or false
    
}
