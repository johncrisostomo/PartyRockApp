//
//  ViewController.swift
//  PartyRockApp
//
//  Created by John Crisostomo on 04/04/2017.
//  Copyright © 2017 John Crisostomo. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let p1 = PartyRock(imageUrl: "https://i.ytimg.com/vi/SjmTFIHX1yo/maxresdefault.jpg",
                           videoUrl: urlTest,
                           videoTitle: "Lights Out")
        let p2 = PartyRock(imageUrl: "http://www.josepvinaixa.com/blog/wp-content/uploads/2013/09/Redfoo-Lets-Get-Ridiculous-2013-1200x1200.png",
                           videoUrl: urlTest,
                           videoTitle: "Let's Get Ridiculous")
        let p3 = PartyRock(imageUrl: "https://i.ytimg.com/vi/J7MQDULNIdU/maxresdefault.jpg",
                           videoUrl: urlTest,
                           videoTitle: "Juicy Wiggle Lesson")
        let p4 = PartyRock(imageUrl: "http://www.billboard.com/files/media/redfoo-prm-cover-2015-billboard-embed.jpg",
                           videoUrl: urlTest,
                           videoTitle: "Party Rock Commercial")
        let p5 = PartyRock(imageUrl: "http://i.dailymail.co.uk/i/pix/2015/02/25/260ECA1900000578-2967882-Where_to_look_Redfoo_dons_a_dazzling_monochrome_short_suit_as_he-m-8_1424829097315.jpg",
                           videoUrl: urlTest,
                           videoTitle: "Juicy Wiggle")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyViewCell", for: indexPath) as? PartyViewCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
}

