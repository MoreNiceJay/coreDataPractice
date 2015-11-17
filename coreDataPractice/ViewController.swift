//
//  ViewController.swift
//  coreDataPractice
//
//  Created by Lee Janghyup on 11/16/15.
//  Copyright © 2015 jay. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var stores : Contacts? = nil
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if stores != nil {
            nameTextField.text = stores?.name
            phoneTextField.text = stores?.phone
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if stores != nil {
            editItem()
        }else {
        
        newItem()
        }
        
        
        
    }
    
    
    func newItem() {
        let context = self.context
        let ent = NSEntityDescription.entityForName("Contacts", inManagedObjectContext: context)
        let item = Contacts(entity: ent!, insertIntoManagedObjectContext: context)
        
        item.name = nameTextField.text
        item.phone = phoneTextField.text
        do { try context.save()}
        catch {}
    
    ㅁ
    }
    func dismiss() {
        
        navigationController?.popToRootViewControllerAnimated(true
        )
    }
    func editItem() {
        stores!.name = nameTextField.text
        stores!.phone = phoneTextField.text
        do { try context.save()}
        catch {}

    }
    
}

