//
//  ShipsTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Jenny on 7/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ShipsTableViewController: UITableViewController {
    
    var pirate: Pirate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pirate = self.pirate {
            return pirate.ships.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("shipCell", forIndexPath: indexPath)

        if let pirate = self.pirate {
            cell.textLabel?.text = Array(pirate.ships)[indexPath.row].name
            if let engine = Array(pirate.ships)[indexPath.row].engine {
                cell.detailTextLabel?.text = "\(engine.propulsionType)"
            }
        }
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "shipDetailSegue" {
            if let shipDetailVC = segue.destinationViewController as? ShipDetailsViewController {
                if let pirate = self.pirate, index = tableView.indexPathForSelectedRow?.row {
                    shipDetailVC.pirate = pirate
                    shipDetailVC.ship = Array(pirate.ships)[index]
                }
            }
        }
    }

}
