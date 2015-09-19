//
//  AdaptiveUIViewController.swift
//  Adaptive UI
//
//  Created by Bob Wakefield on 8/12/15.
//  Copyright © 2015 Bob Wakefield. All rights reserved.
//

import UIKit

class AdaptiveUIViewController: UIViewController {

    let dividerMeasure : CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        self.view.setNeedsLayout()

        super.viewWillTransitionToSize( size, withTransitionCoordinator: coordinator )
    }

    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        
        var childSize: CGSize
        if parentSize.width > parentSize.height {
            
            childSize = CGSizeMake( ( parentSize.width - dividerMeasure ) / 2, parentSize.height )
        }
        else
        {
            childSize = CGSizeMake( parentSize.width, ( parentSize.height - dividerMeasure ) / 2 )
        }
        
        return childSize
    }
}

