//
//  ViewController.swift
//  TicTacToe
//
//  Created by Joel Joseph on 9/27/22.
//
import UIKit
class ViewController: UIViewController {
    var j = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    var x = " "
    var label = "X"
    var values:[Int] = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
    var buttons:[UIButton] = []
    
    //creates button and sets b to take any value of x, y, w, h, i
    func createButton(x: Int, y: Int, w: Int , h: Int, i: Int) -> UIButton{
        let b = UIButton(frame: CGRect(x: x, y: y, width: w, height: h))
        b.tag = i
        b.backgroundColor = UIColor.gray
        buttons.append(b)
        return b
    }
    //reset function to reset all the positions and labels when all the spots are filled or when games over
    func reset() {
        buttons[0].setTitle("", for: .normal)
        buttons[1].setTitle("", for: .normal)
        buttons[2].setTitle("", for: .normal)
        buttons[3].setTitle("", for: .normal)
        buttons[4].setTitle("", for: .normal)
        buttons[5].setTitle("", for: .normal)
        buttons[6].setTitle("", for: .normal)
        buttons[7].setTitle("", for: .normal)
        buttons[8].setTitle("", for: .normal)
        values = [-1,-1,-1,-1,-1,-1,-1,-1,-1]
        j.text = x
    }
    //for the button generation from 1 to 9 uses percent opperator to create a break off point to start a new row with reset x and y values
    override func viewDidLoad() {
        super.viewDidLoad()
        var y = 300
        var x = 50
        for i in 1...9 {
            let newButton = createButton(x: x, y: y, w: 80, h: 80, i: i)
            newButton.addTarget(self, action: #selector(handler), for: .touchUpInside)
            newButton.layer.cornerRadius = 0.5 * newButton.bounds.size.width
            x = x + 100
            self.view.addSubview(newButton)
            if(i % 3 == 0){
                x = 50
                y = y + 100
            }
        }
    }//handler for the x and o labels on the buttons
    @objc func handler(_ sender: UIButton!){
        if(gameOver()){
            reset()
            return
        }
        if(values[sender.tag - 1] == -1){
            let v = label == "X" ? 1 : 0
            values[sender.tag - 1] = v
            sender.setTitle(label, for: .normal)
            label = label == "X" ? "O" : "X"
        }
        print(gameOver())
    }
    //conditions for when its game over checks first and seccond and first and third and any value in that to see if its greater than -1, if it is then it will return false else it will continue on
    func gameOver() -> Bool{
        
        if(values[0] == values[1] && values[2] == values[0] && values[0] != -1){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "The winner is \(values[1] == 1 ? "X": "O") click any circles to reset"
            j.numberOfLines = 0
            self.view.addSubview(j)
            return true
        }
        if(values[3] == values[4] && values[3] == values[5] && values[3] != -1){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "The winner is \(values[3] == 1 ? "X": "O") click any circles to reset"
            j.numberOfLines = 0
            self.view.addSubview(j)
            return true
        }
        if(values[6] == values[7] && values[6] == values[8] && values[6] != -1){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "The winner is \(values[6] == 1 ? "X": "O") click any circles to reset"
            j.numberOfLines = 0
            self.view.addSubview(j)
            return true
        }
        if(values[0] == values[3] && values[0] == values[6] && values[0] != -1){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "The winner is \(values[0] == 1 ? "X": "O") click any circles to reset"
            j.numberOfLines = 0
            self.view.addSubview(j)
            return true
        }
        if(values[1] == values[4] && values[1] == values[7] && values[1] != -1){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "The winner is \(values[7] == 1 ? "X": "O") click any circles to reset"
            j.numberOfLines = 0
            self.view.addSubview(j)
            return true
        }
        if(values[3] == values[5] && values[3] == values[8] && values[3] != -1){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "The winner is \(values[8] == 1 ? "X": "O") click any circles to reset"
            j.numberOfLines = 0
            self.view.addSubview(j)
            return true
        }
        if(values[0] == values[4] && values[0] == values[8] && values[4] != -1){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "The winner is \(values[4] == 1 ? "X": "O") click any circles to reset"
            j.numberOfLines = 0
            self.view.addSubview(j)
            return true
        }
        if(values[2] == values[4] && values[2] == values[6] && values[4] != -1){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "The winner is \(values[2] == 1 ? "X": "O") click any circles to reset"
            j.numberOfLines = 0
            self.view.addSubview(j)
            return true
        }
        //when all the positions are filled
        let over = values[0] > -1 &&  values[1] > -1 && values[2] > -1 &&
        values[3] > -1 &&  values[4] > -1 && values[5] > -1 &&
        values[6] > -1 &&  values[7] > -1 && values[8] > -1
        if(over){
            j.center = CGPoint(x: 180, y: 230)
            j.textAlignment = .center
            j.text = "Tie click a circle to restart"
            j.numberOfLines = 0
            self.view.addSubview(j)
        }
        return over
    }
}
