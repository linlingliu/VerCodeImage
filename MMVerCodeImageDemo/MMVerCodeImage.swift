//
//  MMVerCodeImage.swift
//  MMVerCodeImageDemo
//
//  Created by LX on 2018/5/24.
//  Copyright © 2018年 LX. All rights reserved.
//

import UIKit

class MMVerCodeImage: UIView {

    var imageCode:String!
    var isRotation = false
    fileprivate var textArray :Array<String>!
    fileprivate var bgView:UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func showCodeImage()  {
        changeCodeString()
        showImageView()
    }

}

extension MMVerCodeImage
{
   fileprivate func changeCodeString() {

    textArray=["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    for index in 0..<4 {
        imageCode = index==0 ? textArray[index] :imageCode+textArray[index]
    }
    
    }
    
    fileprivate func showImageView()
    {
        if (bgView != nil){
            bgView.removeFromSuperview()
        }
        bgView=UIView(frame: self.bounds)
        self.addSubview(bgView)
        bgView.backgroundColor = randomColor(0.5)
        let tmp:NSString = "W"
        let dic = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20)]
        let textSize:CGSize = tmp.size(withAttributes: dic)
        let randWidth = self.frame.width / CGFloat(imageCode.count) - textSize.width
        let randHeight = self.frame.height - textSize.height
        
        for index in 0..<imageCode.count {
            let tmp = (self.frame.size.width - 3.0) / CGFloat(imageCode.count)
            let px:CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: randWidth) + CGFloat(index) * tmp
            
            let py = CGFloat(arc4random()).truncatingRemainder(dividingBy: randHeight)
            
            let lbText = UILabel(frame: CGRect(x: px+3.0, y:py , width: textSize.width, height: textSize.height))
            lbText.text = textArray[index]
            lbText.font = UIFont.systemFont(ofSize: 20)
            if isRotation {
                var r = Double(arc4random()) / Double(UInt32.max) * 2.0 - 1.0
                if r > 0.3{
                    r = 0.3
                }else if r < -0.3{
                    r = -0.3
                }
                lbText.transform = CGAffineTransform(rotationAngle: CGFloat(r))
            }
            bgView.addSubview(lbText)
        }
        
        for _ in 1...10{
            let path:UIBezierPath = UIBezierPath.init()
            let pX:CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: self.frame.size.width)
            let pY:CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: self.frame.size.height)
            path.move(to: CGPoint(x: pX, y: pY))
            let ptX:CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: self.frame.size.width)
            let ptY:CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: self.frame.size.height)
            path.addLine(to: CGPoint(x: ptX, y: ptY))
            
            let layer:CAShapeLayer = CAShapeLayer.init()
            layer.strokeColor = randomColor(0.2).cgColor
            layer.lineWidth = 1.0
            layer.strokeEnd = 1
            layer.fillColor = UIColor.clear.cgColor
            layer.path = path.cgPath
            bgView.layer .addSublayer(layer)
        }
    }
    
    fileprivate func randomColor(_ alpha:CGFloat) ->UIColor
    {
        let red:CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: 100.0) / 100.0
        let green:CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: 100.0) / 100.0
        let blue:CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: 100.0) / 100.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
}
