//
//  ViewController.swift
//  DemoAutoLayoutV2
//
//  Created by Juan Antonio Perez Clemente on 27/12/17.
//  Copyright © 2017 Juan Pérez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let whiteView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var topConstraint: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupAutoLayout();
        
        topConstraint = NSLayoutConstraint(item: whiteView, attribute: .top, relatedBy: .equal,
                                           toItem: self.view, attribute: .topMargin, multiplier: 1.0,
                                           constant:20)
        
        topConstraint?.isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        self.view.addSubview(whiteView)
    }
    
    func setupAutoLayout() {
        
        whiteView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive=true
        whiteView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive=true
        
        whiteView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            topConstraint?.constant = 0;
        } else {
            topConstraint?.constant = 20;
        }
    }

}

