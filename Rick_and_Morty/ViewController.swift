//
//  ViewController.swift
//  Rick_and_Morty
//
//  Created by Arthur on 04.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // image label
    var imageLabel = UIImageView()
    let image = UIImage(named: "Label.jpg")
    
    //image louding
    var imageLouding = UIImageView()
    let image2 = UIImage(named: "Loading.jpg")
    //
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        //MARK: - timer
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(performSegueToNextScreen), userInfo: nil, repeats: false)
        
        //MARK: - image label
        let parentWidth = view.bounds.width
        let xCoordinate = (parentWidth - 200) / 2
        self.imageLabel.frame = CGRect(x: xCoordinate, y: 70, width: 200, height: 200)
        self.imageLabel.contentMode = .scaleAspectFit
        self.imageLabel.image = self.image
        self.view.addSubview(self.imageLabel)
        
        //MARK: - image louding
        self.imageLouding.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        self.imageLouding.center = self.view.center
        self.imageLouding.contentMode = .scaleAspectFit
        self.imageLouding.image = self.image2
        self.view.addSubview(self.imageLouding)
        
        // call
        rotateImage(imageView: self.imageLouding)
        
        
    }
    
    // MARK: - rotate image
    func rotateImage(imageView: UIImageView) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = CGFloat.pi * 2
        rotationAnimation.duration = 3.0
        rotationAnimation.repeatCount = Float.infinity
        
        imageView.layer.add(rotationAnimation, forKey: "transform.rotation")
    }
    
    @objc func performSegueToNextScreen() {
        performSegue(withIdentifier: "TabBarView", sender: self)
    }

}

