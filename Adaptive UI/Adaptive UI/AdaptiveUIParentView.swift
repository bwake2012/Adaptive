//
//  AdaptiveUIParentView.swift
//  Adaptive UI
//
//  Created by Bob Wakefield on 9/6/15.
//  Copyright © 2015 Bob Wakefield. All rights reserved.
//

import UIKit

class AdaptiveUIParentView : UIView {
    
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var containerViewOne: UIView!
    @IBOutlet weak var containerViewTwo: UIView!
//    @IBOutlet weak var dividerView: UIView!
    
    override func layoutSubviews() {
        
        let barOrientation = UIApplication.sharedApplication().statusBarOrientation
        let barSize  = UIApplication.sharedApplication().statusBarFrame.size
        let dividerMeasure  : CGFloat = 10
        let statusBarHeight : CGFloat = min(barSize.width, barSize.height)
        
        var sizeDivider : CGSize
        var sizeChild   : CGSize
        var pointOne    : CGPoint = CGPointMake( 0, 0 )
        var pointTwo    : CGPoint = CGPointMake( 0, 0 )
        var pointDivider : CGPoint

        if self.bounds.width > self.bounds.height {
            
            sizeDivider = CGSizeMake( dividerMeasure, self.bounds.size.height - statusBarHeight )
            sizeChild = CGSizeMake( ( self.bounds.size.width - sizeDivider.width ) / 2, self.bounds.size.height - statusBarHeight )
            
        }
        else {
            
            sizeDivider = CGSizeMake( self.bounds.size.width, dividerMeasure )
            sizeChild = CGSizeMake ( self.bounds.size.width, ( self.bounds.size.height - sizeDivider.height - statusBarHeight ) / 2 )
        }

        switch barOrientation {
        case .Portrait:
            pointOne = CGPointMake( 0, statusBarHeight )
            pointTwo = CGPointMake( 0, statusBarHeight + sizeChild.height + dividerMeasure )
            break
        case .PortraitUpsideDown:
            pointOne = CGPointMake( 0, statusBarHeight + sizeChild.height + dividerMeasure )
            pointTwo = CGPointMake( 0, statusBarHeight )
            break
        case .LandscapeLeft:
            pointOne = CGPointMake( sizeChild.width + dividerMeasure, statusBarHeight )
            pointTwo = CGPointMake( 0, statusBarHeight )
            break
        case .LandscapeRight:
            pointOne = CGPointMake( 0, statusBarHeight )
            pointTwo = CGPointMake( sizeChild.width + dividerMeasure, statusBarHeight )
            break
        default:
            break
        }
        
        let statusBarRect = CGRectMake( 0, 0, self.bounds.width, statusBarHeight )
        self.statusBar.frame = statusBarRect
        
        let rectOne = CGRectMake( pointOne.x, pointOne.y, sizeChild.width, sizeChild.height )
        self.containerViewOne.frame = rectOne

//        let dividerRect = CGRectMake( pointDivider.x, pointDivider.y, sizeDivider.width, sizeDivider.height )
//        self.dividerView.frame = dividerRect

        let rectTwo = CGRectMake( pointTwo.x, pointTwo.y, sizeChild.width, sizeChild.height )
        self.containerViewTwo.frame = rectTwo
    }
}