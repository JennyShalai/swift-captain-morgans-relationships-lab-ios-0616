//
//  ShipDetailsViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Jenny on 7/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
import UIKit
import CoreData

class ShipDetailsViewController: UIViewController {
    
    var pirate: Pirate?
    var ship: Ship?

    @IBOutlet weak var propulsionTypeLabel: UILabel!
    @IBOutlet weak var pirateNameLabel: UILabel!
    @IBOutlet weak var shipNameLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        if let pirate = self.pirate, ship = self.ship {
            self.pirateNameLabel.text = pirate.name
            self.shipNameLabel.text = ship.name
            self.propulsionTypeLabel.text = ship.engine?.propulsionType
        }
    }
    
    
}
