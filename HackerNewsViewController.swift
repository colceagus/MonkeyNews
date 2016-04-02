//
//  HackerNewsTableTableViewController.swift
//  MonkeyNews
//
//  Created by training on 3/19/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit

class HackerNewsTableViewController: UITableViewController {

    // viewDidLoad executes only once
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated);
        
        // set Background
        if (NSUserDefaults.standardUserDefaults().boolForKey(SettingsKey.BG.rawValue)) {
            
            // let path = NSBundle.mainBundle().pathForResource("bg1", ofType: ".jpg", inDirectory: "res")
            
            // print(path)
            
            var image:UIImage?;
        
            if (NSUserDefaults.standardUserDefaults().boolForKey(SettingsKey.BG_CUSTOM.rawValue)) {
                image = UIImage(contentsOfFile: NSHomeDirectory() + "/Documents/bg.png")
            } else {
                var option = NSUserDefaults.standardUserDefaults().integerForKey(SettingsKey.BG_OPTION.rawValue)
                
                if (option == 0) {
                    option = 1;
                }
                
                image = UIImage(named: "res/bg\(option).jpg");
            }
            
            let imageView = UIImageView(image: image);
            
            imageView.contentMode = UIViewContentMode.ScaleAspectFill;
            
            print(image);
            
            tableView.backgroundView = imageView
        } else {
            tableView.backgroundView = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        print(segue.identifier)
        
        let comm = HackerNewsComm()
        
        // unwrap
        switch (segue.identifier!) {
            case "go_to_top_stories":
                comm.fetchTopStories({
                    (collection:StoryCollection) in
//                    if let controller:ViewController = segue.destinationViewController as? ViewController {
//                        controller.dataSource = collection.topStories()
//                    }

                    let topStories = collection.topStories()
                    
                    var i = 0;
                    
                    for story in topStories {
                        comm.populateStory(story){ story in
                            i += 1
                            
                            if i >= 10 {
                                (segue.destinationViewController as! ViewController).dataSource = topStories
                            }
                        }
                    }
                    
                    })

                
            break
            case "go_to_new_stories":
            break
            default:
            break;
        }
    }
    

}
