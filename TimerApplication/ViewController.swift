//
//  ViewController.swift
//  TimerApplication
//
//  Created by Rex Fatahi on 6/7/14.
//  Copyright (c) 2014 aug2uag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // timerApplicationLabel
    // timerLabel
    
    // startButton
    // stopResetButton
    
    var timeInMilliseconds:Float = 0.000;
    var stopButtonTitleVariable: NSString = "Stop"
    var isPaused: Bool = false
    
    
    let titleLabelRect = CGRectMake(10, 60, UIScreen.mainScreen().bounds.size.width - 20, 44)
    let timerLabelRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 - 110, 120, 220, 44)
    
    let startButtonRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 - 120, 200, 100, 44)
    let stopButtonRect = CGRectMake(UIScreen.mainScreen().bounds.size.width/2 + 20, 200, 100, 44)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size:16)
        return label
    }()
    
    var timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size:44)
        return label
    }()
    
    var startButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var stopButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleLabel.frame = titleLabelRect
        timerLabel.frame = timerLabelRect
        
        titleLabel.text = "Super Awesome Timer Application"
        timerLabel.text = "0.000"
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(timerLabel)
        
        startButton.frame = startButtonRect
        startButton.setTitle("Start", forState: UIControlState.Normal)
        startButton.addTarget(self, action: "startTimer", forControlEvents: UIControlEvents.TouchUpInside)
        startButton.backgroundColor = UIColor.blueColor()
        self.view.addSubview(startButton)
        
        
        stopButton.frame = stopButtonRect
        stopButton.setTitle(stopButtonTitleVariable, forState: UIControlState.Normal)
        stopButton.addTarget(self, action: "stopTimer", forControlEvents: UIControlEvents.TouchUpInside)
        stopButton.backgroundColor = UIColor.blueColor()
        self.view.addSubview(stopButton)
        
    }
    
    func startTimer() {
        isPaused = false
        stopButtonTitleVariable = "Stop"
        stopButton.setTitle(stopButtonTitleVariable, forState: UIControlState.Normal)
        NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: "updateTimerLabel", userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        // provide the option to reset timer
        isPaused = true
        
        switch (stopButtonTitleVariable) {
            case "Stop":
                if (timeInMilliseconds > 0.000) {
                    stopButtonTitleVariable = "Reset"
                    stopButton.setTitle(stopButtonTitleVariable, forState: UIControlState.Normal)
                }
                break
            case "Reset":
                timerLabel.text = "0.000"
                timeInMilliseconds = 0.000
                stopButtonTitleVariable = "Stop"
                stopButton.setTitle(stopButtonTitleVariable, forState: UIControlState.Normal)
            default:
                break
        }
        
    }
    
    func updateTimerLabel() {
        // has it been stopped?
        if (!isPaused) {
            timeInMilliseconds += 0.001
            timerLabel.text = NSString(format:"%.3f", timeInMilliseconds)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

