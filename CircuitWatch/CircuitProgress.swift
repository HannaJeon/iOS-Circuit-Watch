//
//  CircuitProgress.swift
//  ProjectName
//
//  Created by 홍창남 on 2017. 3. 2..
//  Copyright © 2017 CompanyName. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//
//  This code was generated by Trial version of PaintCode, therefore cannot be used for commercial purposes.
//



import UIKit

public class CircuitProgress : NSObject {

    //// Cache

    private struct Cache {
        static let color: UIColor = UIColor(red: 1.000, green: 0.922, blue: 0.231, alpha: 1.000)
    }

    //// Colors

    public dynamic class var color: UIColor { return Cache.color }

    //// Drawing Methods

    public dynamic class func drawCircuitProgress(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 300, height: 300), resizing: ResizingBehavior = .aspectFit, progress: CGFloat = 0.544) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 300, height: 300), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 300, y: resizedFrame.height / 300)


        //// Color Declarations
        let color3 = UIColor(red: 1.000, green: 0.757, blue: 0.027, alpha: 1.000)
        let color5 = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1.000)

        //// Variable Declarations
        let resultAngle: CGFloat = -1 * progress * 360 + 90
        let percent: CGFloat = progress * 100
        let expression = "\(Int(round(percent)))" + "%"

        //// Group
        //// OutterCircle Drawing
        let outterCirclePath = UIBezierPath(ovalIn: CGRect(x: 25, y: 26, width: 249, height: 249))
        color5.setStroke()
        outterCirclePath.lineWidth = 50
        outterCirclePath.stroke()


        //// ProgressBar Drawing
        let progressBarRect = CGRect(x: 25, y: 25, width: 249, height: 249)
        let progressBarPath = UIBezierPath()
        progressBarPath.addArc(withCenter: CGPoint(x: progressBarRect.midX, y: progressBarRect.midY), radius: progressBarRect.width / 2, startAngle: -90 * CGFloat.pi/180, endAngle: -resultAngle * CGFloat.pi/180, clockwise: true)

        CircuitProgress.color.setStroke()
        progressBarPath.lineWidth = 50
        progressBarPath.lineCapStyle = .round
        progressBarPath.lineJoinStyle = .round
        progressBarPath.stroke()


        //// PercentOfWork Drawing
        context.saveGState()
        context.setAlpha(0.9)

        let percentOfWorkRect = CGRect(x: 78, y: 45, width: 142, height: 95)
        let percentOfWorkStyle = NSMutableParagraphStyle()
        percentOfWorkStyle.alignment = .center
        let percentOfWorkFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 30)!, NSForegroundColorAttributeName: color3, NSParagraphStyleAttributeName: percentOfWorkStyle]

        let percentOfWorkInset: CGRect = percentOfWorkRect.insetBy(dx: 1, dy: 0)
        let percentOfWorkTextHeight: CGFloat = expression.boundingRect(with: CGSize(width: percentOfWorkInset.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: percentOfWorkFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: percentOfWorkInset)
        expression.draw(in: CGRect(x: percentOfWorkInset.minX, y: percentOfWorkInset.minY + (percentOfWorkInset.height - percentOfWorkTextHeight) / 2, width: percentOfWorkInset.width, height: percentOfWorkTextHeight), withAttributes: percentOfWorkFontAttributes)
        context.restoreGState()

        context.restoreGState()
        
        context.restoreGState()

    }

    @objc public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
