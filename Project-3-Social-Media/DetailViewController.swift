//
//  DetailViewController.swift
//  Project 1
//
//  Created by Baris Karalar on 17.05.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var seledtedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Picture \(selectedPictureNumber+1) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
        if let img = seledtedImage {
            imageView.image = UIImage(named: img)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        
        guard let img = imageView.image?.jpegData(compressionQuality: 0.5) else {
            print("No image found")
            return
        }
        
        guard let imgName = seledtedImage else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [img, imgName], applicationActivities: [])
        //Without this the app will crash on ipad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
    

}
