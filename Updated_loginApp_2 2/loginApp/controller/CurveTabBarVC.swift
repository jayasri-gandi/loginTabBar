//
//  CurveTabBarVC.swift
//  loginApp
//
//  Created by Jayasri  on 08/09/22.
//

import UIKit

class CurveTabbarVC: UITabBar {
        private var shapeLayer: CALayer?
        override func draw(_ rect: CGRect) {
    }
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0

        

        if let oldShapeLayer = self.shapeLayer {

            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)

        } else {

            self.layer.insertSublayer(shapeLayer, at: 0)

        }

        self.shapeLayer = shapeLayer

    }

    

    func createPath() -> CGPath {

        let height: CGFloat = 77.0

        let path = UIBezierPath()

        let centerWidth = self.frame.width / 2

        path.move(to: CGPoint(x: 0, y: 0))

        path.addLine(to: CGPoint(x: (centerWidth - height ), y: 0))

        path.addCurve(to: CGPoint(x: centerWidth, y: height - 35),

                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 30, y: height - 35))

        path.addCurve(to: CGPoint(x: (centerWidth + height ), y: 0),

                      controlPoint1: CGPoint(x: centerWidth + 30, y: height - 35), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))

        path.addLine(to: CGPoint(x: self.frame.width, y: 0))

        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))

        path.addLine(to: CGPoint(x: 0, y: self.frame.height))

        path.close()

        return path.cgPath

    }

    

}
