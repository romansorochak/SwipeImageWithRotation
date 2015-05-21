//
//  ViewController.swift
//  SwipeImageAnimation
//
//  Created by super_user on 5/21/15.
//  Copyright (c) 2015 DevCom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var movableConstraint: NSLayoutConstraint!
    @IBOutlet weak var movableViewWithImage: UIView!
    @IBOutlet weak var ignoreImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var currentImageView: UIImageView!
    @IBOutlet weak var nextImageView: UIImageView!
    
    var images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"),
        UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"),
        UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"),
        UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5")]
    var currentImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func swipeImageViewLeft(sender: UISwipeGestureRecognizer) {
        
        let nextImage = self.getNextImage()
        
        if nextImage == nil {
            return
        }
        
        self.nextImageView.image = nextImage
        self.ignoreImageView.hidden = false
        
        let moveX:CGFloat = 1000
        
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.movableConstraint.constant += moveX
            self.movableViewWithImage.transform = CGAffineTransformRotate(self.movableViewWithImage.transform, CGFloat(M_PI))
            self.movableViewWithImage.layoutIfNeeded()
            
            }) { _ in
                
                self.movableConstraint.constant -= moveX
                self.movableViewWithImage.transform = CGAffineTransformRotate(self.movableViewWithImage.transform, CGFloat(M_PI))
                self.ignoreImageView.hidden = true
                self.currentImageView.image = nextImage
        }
    }
    
    
    @IBAction func swipeImageViewRight(sender: UISwipeGestureRecognizer) {
        
        let nextImage = self.getNextImage()
        
        if nextImage == nil {
            return
        }
        
        self.nextImageView.image = nextImage
        self.likeImageView.hidden = false
        
        let moveX: CGFloat = 1000
        
        self.movableViewWithImage.transform = CGAffineTransformRotate(self.movableViewWithImage.transform, CGFloat(M_PI))
        self.movableViewWithImage.transform = CGAffineTransformRotate(self.movableViewWithImage.transform, CGFloat(M_PI))
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.movableConstraint.constant -= moveX
            self.movableViewWithImage.transform = CGAffineTransformInvert(
                CGAffineTransformRotate(
                    self.movableViewWithImage.transform,
                    CGFloat(M_PI)
                )
            )
            self.movableViewWithImage.layoutIfNeeded()
            
            }) { _ in
                
                self.movableConstraint.constant += moveX
                self.movableViewWithImage.transform = CGAffineTransformInvert(CGAffineTransformRotate(self.movableViewWithImage.transform, CGFloat(M_PI)))
                self.likeImageView.hidden = true
                self.currentImageView.image = nextImage
        }
    }
    
    
    
    func getNextImage() -> UIImage? {
        
        if self.currentImage == self.images.count - 1 {
            return nil
        }
        self.currentImage++
        return self.images[self.currentImage]
    }
    
}

