//
//  ViewController.swift
//  CalendarTest
//
//  Created by maochun on 2020/8/14.
//  Copyright © 2020 SecuX. All rights reserved.
//

import UIKit
import CVCalendar

class ViewController: UIViewController {
    
    
    
    lazy var calendarView : CalendarView = {
        let theview = CalendarView()
        theview.translatesAutoresizingMaskIntoConstraints = false
        theview.backgroundColor = .gray
        theview.tintColor = .black
        theview.isHidden = true
        
        self.view.addSubview(theview)
        
        NSLayoutConstraint.activate([
            
            theview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 52),
            theview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            theview.widthAnchor.constraint(equalToConstant: 300),
            theview.heightAnchor.constraint(equalToConstant: 400)
        
        ])
        return theview
    }()
    
    lazy var testButton:  UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 22)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .disabled)
        btn.setTitle(NSLocalizedString("Test", comment: ""), for: .normal)
        
        btn.addTarget(self, action: #selector(showCalendarAction), for: .touchUpInside)
        
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowRadius = 2
        btn.layer.shadowOffset = CGSize(width: 2, height: 2)
        btn.layer.shadowOpacity = 0.3
        
        self.view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            
            btn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -66),
            btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btn.heightAnchor.constraint(equalToConstant: 46),
            
            
        ])
       
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let _ = self.testButton
        
        let _ = self.calendarView
    
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.view.backgroundColor = .white
        
        self.calendarView.setup()
    }

    @objc func showCalendarAction(){
        self.calendarView.isHidden = !self.calendarView.isHidden
    }

}



