//
//  PartyViewCell.swift
//  PartyRockApp
//
//  Created by John Crisostomo on 04/04/2017.
//  Copyright © 2017 John Crisostomo. All rights reserved.
//

import UIKit

class PartyViewCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        // TODO: set image from URL
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch  {
                // handle the error
            }
        }
    }
}
