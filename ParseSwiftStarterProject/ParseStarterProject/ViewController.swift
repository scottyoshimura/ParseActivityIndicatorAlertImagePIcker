//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//  we can think of parse as an online database store. it is saving objects. we can upload our variables and objects and then download them later on to use on the same device or a different device.
//we can store a variety of things in parse including variables, arrays, dictionaries, files, boolean variables.

//we will also set up some spinners and alerts. we will use an activity indicator for the spinner

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    //create an object
       /*
        var product = PFObject(className: "Products")
        product["name"] = "Butter"
        product["description"] = "Nonsalted"
        product["price"] = 2.00
        //we could just use saveInBackgroundWithBlock, but we want to know if there is a problem, so we use the below
        product.saveInBackgroundWithBlock { (success, error) -> Void in
            if success == true {
                println("object saved at parse with ID \(product.objectId)")
                //we can use product.objectId like this becasue it is lazy loaded.
                //we can also the object id to retrieve data from parse
            } else {
                println("failed")
                println(error)
            }
        }
        */
        
        
    //lets retreive data using a query on a particular class name
        var query = PFQuery(className: "Products")
        //and use getObjectInBackgroundWithId, with block enabled so we can do wsomwthing with it. if it is succesful we will get an object. note that if we want to use the parse functions on the object, we have to cast it as a type PFObject and make it optional. lets go ahead and give the error an nserror type
        query.getObjectInBackgroundWithId("IeU4RwJFP5", block: { (object: PFObject?, error: NSError?) -> Void in
            if error != nil {
              println(error)
            } else if let product = object {
                println(object)
                //lets access teh description using objectForKey, note that object is force unwrapped. i could check to see if it is there using an if statement and then setting up a new variable if it is there. also note that if we want to use description, we have to force unrwap it.
                //println(object!.objectForKey("objectId"))
                
                
                //now lets actually update the object's description variable to something else
                product["description"] = "whipped light"
                product["price"] = 4.99
                
                //now lets save the updates, and we can just saveInBackground because we don't need a block. if we wanted to check that the save happened or want something to happen when the save has occured we would need a block.
                product.saveInBackground()
            }
        })
        
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

