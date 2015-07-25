//
//  ViewController.swift
//  AdaptiveOne
//
//  Created by Bob Wakefield on 6/23/15.
//  Copyright © 2015 Bob Wakefield. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var appTitleText = ""
        {
            didSet
            {
                self.appTitle.text = appTitleText
            }
        }

    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var horizontalSizeClass: UILabel!
    @IBOutlet weak var verticalSizeClass: UILabel!
    @IBOutlet weak var scale: UILabel!
    @IBOutlet weak var userInterfaceIdiom: UILabel!
    @IBOutlet weak var windowWidth: UILabel!
    @IBOutlet weak var windowHeight: UILabel!
    @IBOutlet weak var testTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appTitle.text = appDelegate.titleText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.windowWidth.text  = "\(self.view.bounds.size.width)"
        self.windowHeight.text = "\(self.view.bounds.size.height)"
    }

    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {

        super.traitCollectionDidChange(previousTraitCollection)

        var horzSizeText: String
        switch self.traitCollection.horizontalSizeClass {

            case .Compact:
                horzSizeText = "Compact"
            case .Regular:
                horzSizeText = "Regular"
            default:
                horzSizeText = "Unspecified"
        }
        self.horizontalSizeClass.text = horzSizeText
        
        switch self.traitCollection.verticalSizeClass {

            case .Compact:
                self.verticalSizeClass.text = "Compact"
            case .Regular:
                self.verticalSizeClass.text = "Regular"
            default:
                self.verticalSizeClass.text = "Unspecified"
        }
        
        self.scale.text = "\(self.traitCollection.displayScale)"
        
        switch self.traitCollection.userInterfaceIdiom {

            case .Unspecified:
                self.userInterfaceIdiom.text = "Unspecified"
            case .Phone:
                self.userInterfaceIdiom.text = "Phone"
            case .Pad:
                self.userInterfaceIdiom.text = "Pad"
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize,
        withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {

        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        self.windowWidth.text  = "\(size.width)"
        self.windowHeight.text = "\(size.height)"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        
        return false
    }
}

