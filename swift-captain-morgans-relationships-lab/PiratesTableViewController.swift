//
//  piratesTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Jenny on 7/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PiratesTableViewController: UITableViewController {
    
    let dataStore = DataStore.dataStore

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataStore.fetchPirates()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataStore.pirates.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pirateCell", forIndexPath: indexPath)
        cell.textLabel?.text = self.dataStore.pirates[indexPath.row].name
        cell.detailTextLabel?.text = "\(self.dataStore.pirates[indexPath.row].ships.count)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "shipsSegue" {
            if let shipsVC = segue.destinationViewController as? ShipsTableViewController {
                if let index = tableView.indexPathForSelectedRow?.row {
                    shipsVC.pirate = self.dataStore.pirates[index]
                }
            }
        }
    }

}
