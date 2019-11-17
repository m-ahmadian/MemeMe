//
//  SentMemesTableViewController.swift
//  MemeMe 1.0 - 2
//
//  Created by Mehrdad on 2019-11-17.
//  Copyright © 2019 Mehrdad. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // MARK: Properties
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    
    // MARK: UITableView Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMemeCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = meme.topText
        cell.detailTextLabel?.text = meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    
    // MARK: UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailMemeController: DetailMemeViewController
        detailMemeController = self.storyboard?.instantiateViewController(withIdentifier: "DetailMemeViewController") as! DetailMemeViewController
        
        detailMemeController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        self.navigationController?.pushViewController(detailMemeController, animated: true)
    }
    
    
    
    // MARK: Actions
    @IBAction func createNewMeme(_ sender: Any) {
        let newMemeController: ViewController
        newMemeController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.present(newMemeController, animated: true, completion: nil)
    }
    

}
