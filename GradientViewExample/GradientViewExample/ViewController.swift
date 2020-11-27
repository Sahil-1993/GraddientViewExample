//
//  ViewController.swift
//  GradientViewExample
//
//  Created by Sahil Arora on 2020-11-27.
//  Copyright © 2020 Sahil Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {

    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    
    let gradient_ColorOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
    let gradient_ColorTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
    let gradient_ColorThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor
    override func viewDidLoad() {
        super.viewDidLoad()
       createGradientBackground()
    }

    func createGradientBackground(){
     
        gradientSet.append([gradient_ColorOne, gradient_ColorTwo])
        gradientSet.append([gradient_ColorTwo, gradient_ColorThree])
        gradientSet.append([gradient_ColorThree, gradient_ColorOne])
        
        
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        self.view.layer.addSublayer(gradient)
        
        animateGradient()
    }
    func animateGradient()
    {
       if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }
     func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
            if flag {
                gradient.colors = gradientSet[currentGradient]
                animateGradient()
            }
        }
    }


