//
//  ViewController.swift
//  AutoLayout
//
//  Created by leslie on 4/13/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel: UILabel!
    var button: UIButton!
    var button2: UIButton!
    var button3: UIButton!
    
    var constraintLeft: NSLayoutConstraint!
    var constraintRight: NSLayoutConstraint!
    var constraintCenter: NSLayoutConstraint!
    
    var constraintWidth: NSLayoutConstraint!
    var constraintHeight: NSLayoutConstraint!
    
    var grayView: UIView!
    var greenView: UIView!
    var counterX: CGFloat = 0
    var counterY: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Removing Constraints
        initLabel()
        configConstraints()
        initButton()
        
        //Updating Constraints
        initButton2()
        
        //Attaching constraints to the view's anchors
        initGrayView()
        
        //Adding constraints with the isActive property
        initGreenView()
        
    }

    //MARK: - Removing Layout Constraints
    func initLabel() {
        myLabel = UILabel(frame: CGRect.zero)
        myLabel.text = "Center"
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myLabel)
        
        let constraintLabel = NSLayoutConstraint(item: myLabel as UILabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50)
        view.addConstraint(constraintLabel)
    }
    
    func initButton() {
        button = UIButton(type: .system)
        button.setTitle("Move Label", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.moveLabel), for: .touchUpInside)
        view.addSubview(button)
        
        let constraintBtnTop = NSLayoutConstraint(item: button!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 80)
        
        let constraintBtnCenterX = NSLayoutConstraint(item: button!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        view.addConstraints([constraintBtnTop, constraintBtnCenterX])
    }
    
    @objc func moveLabel() {
        let text = myLabel.text!
        switch text {
        case "Left":
            view.removeConstraint(constraintRight)
            view.addConstraint(constraintLeft)
            myLabel.text = "Center"
        case "Right":
            view.removeConstraint(constraintCenter)
            view.addConstraint(constraintRight)
            myLabel.text = "Left"
        case "Center":
            view.removeConstraint(constraintLeft)
            view.addConstraint(constraintCenter)
            myLabel.text = "Right"
        default:
            break
        }
    }

    func configConstraints() {
        
        constraintLeft = NSLayoutConstraint(item: myLabel!, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 20)
        
        constraintRight = NSLayoutConstraint(item: myLabel!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -20)
        
        constraintCenter = NSLayoutConstraint(item: myLabel!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
    }
    
    //MARK: - Updating Constraints
    func initButton2() {
        button2 = UIButton(type: .system)
        button2.setTitle("Expand", for: .normal)
        button2.backgroundColor = #colorLiteral(red: 1, green: 0.5985124144, blue: 0.1882352941, alpha: 1)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(self.expandBtn), for: .touchUpInside)
        view.addSubview(button2)
        
        let constraintTop = NSLayoutConstraint(item: button2!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150)
        let constraintCenterX = NSLayoutConstraint(item: button2!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        view.addConstraints([constraintTop, constraintCenterX])

        constraintWidth = NSLayoutConstraint(item: button2!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        constraintHeight = NSLayoutConstraint(item: button2!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        
        view.addConstraints([constraintWidth, constraintHeight])
    }
    
    @objc func expandBtn() {
        if constraintWidth.constant < 280 {
            button2.setTitle("Contract", for: .normal)
            constraintWidth.constant = 280
        } else {
            button2.setTitle("Extend", for: .normal)
            constraintWidth.constant = 150
        }
        
        if constraintHeight.constant < 150 {
            button2.setTitle("Contract", for: .normal)
            constraintHeight.constant = 150
        } else {
            button2.setTitle("Extend", for: .normal)
            constraintHeight.constant = 50
        }
    }
    
    //MARK: - Attaching constraints to the view's anchors
    func initGrayView() {
        //Auto Resizing
        grayView = UIView(frame: CGRect.zero)
        grayView.backgroundColor = .gray
        grayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(grayView)
        
        //Manually Resizing
        let constraint1 = grayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let constraint2 = grayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250)
        let constraint3 = grayView.widthAnchor.constraint(equalToConstant: 50)
        let constraint4 = grayView.heightAnchor.constraint(equalToConstant: 50)
        
        view.addConstraints([constraint1, constraint2, constraint3, constraint4])
    }
    
    //MARK: - Adding constraints with the isActive property
    func initGreenView() {
        //Auto Resizing
        greenView = UIView(frame: CGRect.zero)
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
        
        //Manually Resizing
        greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
}

