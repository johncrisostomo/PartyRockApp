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
        
        let lightsOutUrl = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>"
        let letsGetRidiculousUrl = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>"
        let juicyWiggleUrl = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>"
        let partyRockAnthemUrl = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>"
        let whereTheSunGoesUrl = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TrVLu9p65a0?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>"
        
        
        let p1 = PartyRock(imageUrl: "https://i.ytimg.com/vi/SjmTFIHX1yo/maxresdefault.jpg",
                           videoUrl: lightsOutUrl,
                           videoTitle: "Lights Out")
        let p2 = PartyRock(imageUrl: "http://www.josepvinaixa.com/blog/wp-content/uploads/2013/09/Redfoo-Lets-Get-Ridiculous-2013-1200x1200.png",
                           videoUrl: letsGetRidiculousUrl,
                           videoTitle: "Let's Get Ridiculous")
        let p3 = PartyRock(imageUrl: "https://i.ytimg.com/vi/J7MQDULNIdU/maxresdefault.jpg",
                           videoUrl: juicyWiggleUrl,
                           videoTitle: "Juicy Wiggle")
        let p4 = PartyRock(imageUrl: "http://www.billboard.com/files/media/redfoo-prm-cover-2015-billboard-embed.jpg",
                           videoUrl: partyRockAnthemUrl,
                           videoTitle: "Party Rock Anthem")
        let p5 = PartyRock(imageUrl: "https://i.ytimg.com/vi/ntmwt2l3Vko/maxresdefault.jpg",
                           videoUrl: whereTheSunGoesUrl,
                           videoTitle: "Where the Sun Goes")
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}

