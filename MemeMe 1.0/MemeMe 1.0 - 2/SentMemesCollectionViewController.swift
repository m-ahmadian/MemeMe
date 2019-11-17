//
//  SentMemesCollectionViewController.swift
//  MemeMe 1.0 - 2
//
//  Created by Mehrdad on 2019-11-17.
//  Copyright © 2019 Mehrdad. All rights reserved.
//

import UIKit


class CustomMemeCell: UICollectionViewCell {
    @IBOutlet weak var collectionImageView: UIImageView!
}


class SentMemesCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    // MARK: Properties
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    

    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let space: CGFloat = 3.0
        let dimensionWidth = (self.view.frame.size.width - (space * 2)) / 3
        let dimensionHeight = (self.view.frame.size.height - (space * 4)) / 5
        
        self.flowLayout.minimumLineSpacing = space
        self.flowLayout.minimumInteritemSpacing = space
        self.flowLayout.itemSize = CGSize(width: dimensionWidth, height: dimensionHeight)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadInputViews()
        self.collectionView.reloadData()
    }
    

    
    // MARK: UICollectionView Data Source Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomMemeCell", for: indexPath) as! CustomMemeCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.collectionImageView?.image = meme.memedImage
        
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC: DetailMemeViewController
        detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailMemeViewController") as! DetailMemeViewController
        
        detailVC.meme = self.memes[(indexPath as NSIndexPath).row]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    // MARK: Actions
    @IBAction func createNewMeme(_ sender: Any) {
        let newMemeController: ViewController
        newMemeController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.present(newMemeController, animated: true, completion: nil)
    }
    

}
