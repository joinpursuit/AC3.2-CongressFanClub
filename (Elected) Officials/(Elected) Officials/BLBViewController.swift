//
//  BLBViewController.swift
//  (Elected) Officials
//
//  Created by Harichandan Singh on 11/9/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import UIKit

class BLBViewController: UIViewController {
    //MARK: Properties
    var gender: String?
    var firstName: String?
    var lastName: String?
    var sex: String {
        if self.gender == "male" {
            return "m"
        }
        else {
            return "f"
        }
    }
    
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    func loadImage() {
        var memeApiEndpoint: String {
            return "http://belikebill.azurewebsites.net/billgen-API.php?default=1&name=\(self.firstName!)&sex=\(sex)"
        }
        APIRequestManager.manager.getData(apiEndpoint: memeApiEndpoint) { (data: Data?) in
            if let d = data {
                if let memeImage = UIImage(data: d) {
                    DispatchQueue.main.async {
                        self.memeImageView.image = memeImage
                    }
                }
            }
        }
    }
    
    
    //MARK: - Actions
    @IBAction func twitterButtonTapped(_ sender: UIButton) {
        
    }
    
    
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        let cmp = storyboard.instantiateViewController(withIdentifier: "congressMemberPicker")
    //        self.tabBarController?.present(cmp, animated: true, completion: {
    //            print("Hello")
    //        })
    //
    //    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "newsSegue" {
            let dvc = segue.destination as! NewsTableViewController
            dvc.endPoint = "https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=31ae7c06e3314e21b83c2b3846fe3f26&q=\(self.firstName!.lowercased())+\(self.lastName!.lowercased())"
            print(dvc.endPoint)
            
            
        }
    }
}


//dismissViewController
//presentingViewController
//notifications
