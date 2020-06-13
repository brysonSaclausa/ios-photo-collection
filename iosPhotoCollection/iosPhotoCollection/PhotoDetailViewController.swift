//
//  PhotoDetailViewController.swift
//  iosPhotoCollection
//
//  Created by B$hady on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var addAMovieTextField: UITextField!
    @IBAction func addPhoto(_ sender: Any) {
    }
    @IBAction func savePhoto(_ sender: Any) {
    }
    
     func setTheme() {
           guard let currentTheme = themeHelper?.themePreference else { return }
           if currentTheme == "Dark" {
               view.backgroundColor = UIColor(named: "Dark")
           } else {
            view.backgroundColor = UIColor(named: "Light2")
           }
       
       }
    
    func updateViews() {
    setTheme()
    guard let photo = photo else { return }
    selectedImageView.image = UIImage(data: photo.imageData)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    updateViews()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        themeHelper?.setTheme(viewController: self)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
