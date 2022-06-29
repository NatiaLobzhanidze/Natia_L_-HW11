//
//  ViewController.swift
//  Natia_L_ HW11
//
//  Created by Natia's Mac on 30.06.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstLabel.text = "\(Int.random(in: 1...100))"
        self.secondLabel.text = "\(Int.random(in: 1...100))"
        self.thirdLabel.text = "\(Int.random(in: 1...100))"
    }

    
    @IBAction func changerSlider(_ sender: UISlider) {
        
        let senderValue = Int(sender.value)

        self.firstLabel.text = "\(Int.random(in: 1...senderValue))"
        self.secondLabel.text = "\(Int.random(in: 1...senderValue))"
        self.thirdLabel.text = "\(Int.random(in: 1...senderValue))"
    }
    //შევქმნათ ბრძანების ტიპები
    enum Commonds {
        case maximum, avarage, minimum
    }
    
 
    @IBAction func nextButton(_ sender: UIButton) {
        if let commandWord =  myTextField.text?.lowercased() {
            switch commandWord {
            case "maximum":
                resultLabel.text = checkNumbers(by: .maximum)
            case "avarage":
                resultLabel.text = checkNumbers(by: .avarage)
            case "minimum":
                resultLabel.text = checkNumbers(by: .minimum)
            default:
                resultLabel.text = "ჩაწერეთ ბრძანება შემდეგნაირად - maximum, minimum ან avarage"
            }
        } else {
            resultLabel.text = "გთხოვთ შეავსოთ ბრძანების ველი"
        }
        
    }
    
    
    // შევქმნათ დამხმარე ფუნქცია, რომელიც შედეგებს დაითვლის ბრძანების ტიპის მიხედვით
    
    func checkNumbers(by commond: Commonds ) -> String {
        
        let  myarr = [firstLabel.text, secondLabel.text, thirdLabel.text]
        let setFromArr = Set(myarr)
        
        // შეიძლება შემოწმება if !myarr.isEmpty, მაგრამ ვიცით რომ ცარიელი ვერ იქნება  ამიტომ ვაგრძელებ
        let sortedArr = setFromArr.compactMap{Int($0!)}.sorted(by: {$0 > $1})
        if setFromArr.count == 3 {
            switch commond {
            case .maximum:
                return "მოცემული რიცხვებიდან მაქსიმალურია - \(sortedArr[0])"
            case .avarage:
                return  "მოცემული რიცხვებიდან საშუალოა - \(sortedArr[1])"
            case .minimum:
                return "მოცემული რიცხვებიდან მინიმალურია - \(sortedArr[2]) "
            }
        } else  if setFromArr.count == 2 {
            switch commond {
            case .maximum:
                return "მოცემული რიცხვებიდან მაქსიმუმია - \(sortedArr[0])"
            case .avarage:
                return  "რიცხვებიდან საშუალო მაჩვენებელი არ ფიქსირდება"
            case .minimum:
                return "მოცემული რიცხვებიდან მინიმალურია - \(sortedArr[1])"
            }
        } else if setFromArr.count == 1 {
            return "მოცემული რიცხვების ერთმანეთის ტოლია"
        } else {
            return "დაფიქსირდა შეცდომა, გთხოტ ხელახლა სცადოთ"
        }
    }
    
    
}

