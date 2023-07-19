//
//  ViewController.swift
//  FLAG
//
//  Created by 張丰澤 on 2023/7/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        func starView(_ xPosition:Double,_ yPsition:Double) -> UIView{
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 5.54, y: 0))
            path.addLine(to: CGPoint(x:  6.79, y:  3.83))
            path.addLine(to: CGPoint(x: 10.82, y:  3.83))
            path.addLine(to: CGPoint(x:  7.56, y:  6.20))
            path.addLine(to: CGPoint(x:  8.80, y: 10.03))
            path.addLine(to: CGPoint(x:  5.54, y:  7.66))
            path.addLine(to: CGPoint(x:  2.29, y: 10.03))
            path.addLine(to: CGPoint(x:  3.53, y:  6.20))
            path.addLine(to: CGPoint(x:  0.27, y:  3.83))
            path.addLine(to: CGPoint(x:  4.30, y:  3.83))
            path.close()
            let starView = UIView(frame: CGRect(x: xPosition, y: yPsition, width: 30.8, height: 30.8))
            let starLayer = CAShapeLayer()
            starLayer.path = path.cgPath
            starLayer.fillColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
            starView.layer.addSublayer(starLayer)
            return starView
        }
        
        let redArea = UIView(frame: CGRect(x: 25, y: 100, width: 342, height: 180))
        redArea.backgroundColor = UIColor(red: 0.698, green: 0.132, blue: 0.203, alpha: 1)
        redArea.layer.borderWidth = 1
        redArea.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(redArea)
        
        for i in 0 ... 5 {
            let whiteLine = UIView(frame: CGRect(x: 0, y: 13.842 + 13.842 * Double(i*2), width: 342, height: 13.842))
            whiteLine.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            whiteLine.layer.borderWidth = 1
            redArea.addSubview(whiteLine)
        }
        
        let blueArea = UIView(frame: CGRect(x: 0, y: 0, width: 136.8, height: 96.93))
        blueArea.backgroundColor = UIColor(red: 0.234, green: 0.233, blue: 0.43, alpha: 1)
        blueArea.layer.borderWidth = 1
        redArea.addSubview(blueArea)
        
        for v in 1 ... 9 {
            var starAmount = 6
            var starXStart = 5.854
            if v % 2 == 0 {starAmount = 5; starXStart = 17.248 }
            while starAmount > 0 {
                redArea.addSubview(starView(starXStart + (11.394 * Double((starAmount-1)*2)),   -4.144 + (9.684 * Double(v))))
                starAmount -= 1
                }
        }
        let starXPitch = 11.394
        let starYPitch = 9.684
        for v in 0 ... 4 {
            for h in 0 ... 5 {
                redArea.addSubview(starView(5.854 + starXPitch * Double(h*2), 4.144 + starYPitch * Double(v*2)))
            }
        }
        for v in 0 ... 3 {
            for h in 0 ... 4 {
                redArea.addSubview(starView(17.248 + starXPitch * Double(h*2), 13.828 + starYPitch * Double(v*2)))
            }
        }
    }
}
#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}

