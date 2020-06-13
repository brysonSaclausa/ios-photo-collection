//
//  PhotosCollectionViewController.swift
//  iosPhotoCollection
//
//  Created by B$hady on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    func setTheme() {
        guard let currentTheme = themeHelper.themePreference else { return }
        if currentTheme == "Dark" {
            collectionView.backgroundColor = UIColor(named: "Dark")
        } else {
            collectionView.backgroundColor = UIColor(named: "Light")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        themeHelper.setTheme(viewController: self)
        setTheme()
        collectionView.reloadData()
    }

    
    // MARK: - Navigation

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPhotoButtonSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            photoDetailVC.themeHelper = themeHelper
        } else if segue.identifier == "collectionViewCellToPhotoDetailVCSegue" {
            guard let photoDetatilCell = segue.destination as? PhotoDetailViewController else { return }
            photoDetatilCell.themeHelper = themeHelper
        } else if segue.identifier == "selectThemeButtonSegue" {
            guard let selectThemeVC = segue.destination as?  ThemeSelectionViewController else { return }
            selectThemeVC.themeHelper = themeHelper
    }
    
}

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
     
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return photoController.photos.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
        
        let photo = photoController.photos[indexPath.row]
        
        cell.photo = photo
        
        // Configure the cell
        cell.backgroundColor = .red
        return cell
    }

    
    
    
    
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
