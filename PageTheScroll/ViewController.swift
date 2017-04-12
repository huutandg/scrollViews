//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Tan on 4/11/17.
//  Copyright © 2017 Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y:   scrollView.frame.size.height / 2 - 75, width: 150, height: 150)
        }
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                scrollView.setContentOffset(CGPoint.init(x: scrollView.contentOffset.x - 220, y: 0), animated: true)
                
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                scrollView.setContentOffset(CGPoint.init(x: scrollView.contentOffset.x - 220, y: 0), animated: true)
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
}

