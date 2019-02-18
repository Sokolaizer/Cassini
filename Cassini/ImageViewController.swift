//
//  ImageViewController.swift
//  Cassini
//
//  Created by Admin on 18.02.2019.
//  Copyright © 2019 Roman Kozlov. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController , UIScrollViewDelegate{
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
        
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.maximumZoomScale = 1 / 25
            scrollView.minimumZoomScale = 1
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    var imageView: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
        
    }
    
}
