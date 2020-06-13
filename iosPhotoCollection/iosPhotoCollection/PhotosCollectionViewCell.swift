//
//  PhotosCollectionViewCell.swift
//  iosPhotoCollection
//
//  Created by B$hady on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
        updateViews()
    }
}

    func updateViews() {
        //photoImageView.image = photo?.imageData
        photoNameLabel.text = photo?.title
    }
}
