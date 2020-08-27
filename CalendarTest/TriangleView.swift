//
//  TriangleView.swift
//  DropdownUsingPopover
//
//  Created by Maochun Sun on 2020/7/2.
//  Copyright © 2020 Maochun. All rights reserved.
//

import UIKit

enum TriangleType{
    case left
    case right
    case top
    case bottom
}

class TriangleView : UIView {
    
    var triangleColor = UIColor.blue
    var triangleType = TriangleType.top

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
       
    }
    

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        
        switch self.triangleType {
        case .top:
            context.move(to: CGPoint(x: rect.minX, y: rect.minY))
            context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.maxY))
            break
            
        case .bottom:
            context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
            break
            
        case .left:
            context.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            context.addLine(to: CGPoint(x: rect.minX, y: (rect.maxY / 2.0)))
            break
            
        case .right:
            context.move(to: CGPoint(x: rect.minX, y: rect.minY))
            context.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            context.addLine(to: CGPoint(x: rect.maxX, y: (rect.maxY / 2.0)))
            break
       
        }
        
        context.closePath()

        //context.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60)
        context.setFillColor(triangleColor.cgColor)
        context.fillPath()
    }
}
