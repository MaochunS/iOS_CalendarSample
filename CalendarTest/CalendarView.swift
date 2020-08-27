//
//  CalendarView.swift
//  CalendarTest
//
//  Created by maochun on 2020/8/14.
//  Copyright © 2020 SecuX. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarView: UIView {
  
    
        
    lazy var dateLabel : UILabel = {
         let label = UILabel()

         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "10" //"\(row+1)"

         //label.font = UIFont.preferredFont(forTextStyle: .headline)
         //label.adjustsFontForContentSizeCategory = true
         label.font = UIFont.init(name: "Arial", size: 18)
         label.textColor = UIColor.black
         label.textAlignment = NSTextAlignment.left

         label.numberOfLines = 0
         label.lineBreakMode = NSLineBreakMode.byWordWrapping
         label.sizeToFit()


         self.addSubview(label)
         
         
         NSLayoutConstraint.activate([
             
             label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
             label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             label.heightAnchor.constraint(equalToConstant: 40)
         
         ])
         
         return label
     }()
    
    lazy var separateView : UIView = {
        let theview = UIView()

        theview.translatesAutoresizingMaskIntoConstraints = false
        theview.backgroundColor = .white

        self.addSubview(theview)
        
        
        NSLayoutConstraint.activate([
            
            theview.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 5),
            theview.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            theview.heightAnchor.constraint(equalToConstant: 2)
        
        ])
        
        return theview
    }()
    
    lazy var leftTriangleView : TriangleView = {
        let theview = TriangleView()
        theview.translatesAutoresizingMaskIntoConstraints = false
        theview.triangleType = .left
        theview.triangleColor = .darkGray
        let gesture = UITapGestureRecognizer(target: self, action:#selector(prevMonthAction))
        theview.addGestureRecognizer(gesture)
        
        self.addSubview(theview)
        
        
        NSLayoutConstraint.activate([
            
            theview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            theview.centerYAnchor.constraint(equalTo: self.dateLabel.centerYAnchor),
            theview.widthAnchor.constraint(equalToConstant: 20),
            theview.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        return theview
    }()
     
    lazy var rightTriangleView : TriangleView = {
        let theview = TriangleView()
        theview.translatesAutoresizingMaskIntoConstraints = false
        theview.triangleType = .right
        theview.triangleColor = .darkGray
        let gesture = UITapGestureRecognizer(target: self, action:#selector(nextMonthAction))
        theview.addGestureRecognizer(gesture)
        
        self.addSubview(theview)
        
        
        NSLayoutConstraint.activate([
            
            theview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            theview.centerYAnchor.constraint(equalTo: self.dateLabel.centerYAnchor),
            theview.widthAnchor.constraint(equalToConstant: 20),
            theview.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
        return theview
    }()
    
     lazy var menuView : CVCalendarMenuView = {
         let theview = CVCalendarMenuView()
         theview.translatesAutoresizingMaskIntoConstraints = false
         theview.backgroundColor = .gray
         theview.tintColor = .black
    
         
         self.addSubview(theview)
         
         NSLayoutConstraint.activate([
             
             theview.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 10),
             theview.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             theview.widthAnchor.constraint(equalToConstant: 300),
             theview.heightAnchor.constraint(equalToConstant: 40)
         
         ])
         return theview
     }()

     lazy var calendarView : CVCalendarView = {
         let theview = CVCalendarView()
         theview.translatesAutoresizingMaskIntoConstraints = false
         theview.backgroundColor = .gray
         theview.tintColor = .black
     
         
         self.addSubview(theview)
         
         NSLayoutConstraint.activate([
             
             theview.topAnchor.constraint(equalTo: self.menuView.bottomAnchor, constant: 2),
             theview.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             theview.widthAnchor.constraint(equalToConstant: 300),
             theview.heightAnchor.constraint(equalToConstant: 200)
         
         ])
         return theview
     }()
    
    

    
    func setup(){
        self.backgroundColor = UIColor(red: 0xFE/0xFF, green: 0xFE/0xFF, blue: 0xFE/0xFF, alpha: 1)
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0xFE/0xFF, green: 0xFE/0xFF, blue: 0xFE/0xFF, alpha: 1)
        
        let _ = self.separateView
        let _ = self.leftTriangleView
        let _ = self.rightTriangleView
  
        self.calendarView.calendarAppearanceDelegate = self
        self.calendarView.animatorDelegate = self
        self.menuView.menuViewDelegate = self
        self.calendarView.calendarDelegate = self
        
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         
        self.backgroundColor = UIColor(red: 0xFE/0xFF, green: 0xFE/0xFF, blue: 0xFE/0xFF, alpha: 1)
        
        let _ = self.calendarView
        
         
     }
    
    @objc func nextMonthAction(){
        self.calendarView.loadNextView()
    }
    
    @objc func prevMonthAction(){
        self.calendarView.loadPreviousView()
    }
     
}

extension CalendarView: CVCalendarViewDelegate,CVCalendarMenuViewDelegate {
    func firstWeekday() -> Weekday {
        return .sunday
    }
    
    //视图模式
    func presentationMode() -> CalendarMode {
        //使用月视图
        return .monthView
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        
        self.dateLabel.text = "\(date.year)年\(date.month)月"
        
    }
    
    func shouldAutoSelectDayOnMonthChange() -> Bool {
        return false
    }
    
    
    func didSelectDayView(_ dayView: CVCalendarDayView, animationDidFinish: Bool) {
        //获取日期
        let date = dayView.date.convertedDate()!
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日"
        let message = "当前选择的日期是：\(dformatter.string(from: date))"
        //将选择的日期弹出显示
        //let alertController = UIAlertController(title: "", message: message,
        //                                        preferredStyle: .alert)
        //let okAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        //alertController.addAction(okAction)
        //self.present(alertController, animated: true, completion: nil)
    }
}
