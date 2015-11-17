//
//  TableViewController.swift
//  coreDataPractice
//
//  Created by Lee Janghyup on 11/16/15.
//  Copyright © 2015 jay. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var fetchedResultController : NSFetchedResultsController = NSFetchedResultsController()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        fetchedResultController = getFetchResultController()
        fetchedResultController.delegate = self
        do { try fetchedResultController.performFetch()}
        catch {}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //var numberOfRowsInSection = fetchedResultController.sections?.count
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var numberOfRowsInSection = fetchedResultController.sections![section].numberOfObjects
        return numberOfRowsInSection
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        var stores = fetchedResultController.objectAtIndexPath(indexPath) as! Contacts
        cell.textLabel?.text = stores.name
        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edit"{
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            var destViewController : ViewController = segue.destinationViewController as! ViewController
            var stores : Contacts = fetchedResultController.objectAtIndexPath(indexPath!) as! Contacts
            destViewController.stores = stores
            
        }
    }
    
    
    func getFetchResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: contactFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func contactFetchRequest() -> NSFetchRequest {
        var fetchRequest = NSFetchRequest(entityName: "Contacts")
        var sortDesctiptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDesctiptor]
        return fetchRequest
    }
    
    
        
}
