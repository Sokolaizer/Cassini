//
//  ImageViewController.swift
//  Cassini
//
//  Created by Admin on 18.02.2019.
//  Copyright © 2019 Roman Kozlov. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: URL? {
        didSet {
            ImageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if ImageView.image == nil {
            fetchImage()
        }
        
    }

    @IBOutlet weak var ImageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                ImageView.image = UIImage(data: imageData)
            }
        }
        
    }
    
}
