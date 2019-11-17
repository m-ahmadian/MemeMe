//
//  DetailMemeViewController.swift
//  MemeMe 1.0 - 2
//
//  Created by Mehrdad on 2019-11-17.
//  Copyright © 2019 Mehrdad. All rights reserved.
//

import UIKit

class DetailMemeViewController: UIViewController {
    
    
    // MARK: Properties
    var meme: Meme!
    
    
    // MARK: Outlets
    @IBOutlet weak var detailImageView: UIImageView!
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.detailImageView.image = meme.memedImage
    }
    
}
