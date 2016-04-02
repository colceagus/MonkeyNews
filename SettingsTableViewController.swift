//
//  SettingsTableViewController.swift
//  MonkeyNews
//
//  Created by Andrei Vasilescu on 02/04/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var bgSwitch: UISwitch!
    @IBOutlet weak var bgVariant: UISegmentedControl!
    
    @IBAction func tappedChooseButton(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self

        NSUserDefaults.standardUserDefaults().setBool(false, forKey: SettingsKey.BG_CUSTOM.rawValue)
        NSUserDefaults.standardUserDefaults().synchronize();
        
        let alert = UIAlertController(title: "Choose", message: "CHoose an input type", preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let action = UIAlertAction(title: "Camera", style: .Default, handler: { (ac) in
            })
            alert.addAction(action)
        }
        
        if (UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum)) {
            let action = UIAlertAction(title: "Photos", style: .Default, handler: { (ac) in
                })
            
            alert.addAction(action)
        }
        
        let action = UIAlertAction(title:"Cancel", style:.Cancel) { (ac) in
            
        }
        
        alert.addAction(action)
        presentViewController(imagePicker, animated: false) {
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image:UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let imageData = UIImagePNGRepresentation(image);
            
            do {
                try imageData?.writeToFile(NSHomeDirectory() + "/Documents/bg.png", atomically: true)
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: SettingsKey.BG_CUSTOM.rawValue)
                NSUserDefaults.standardUserDefaults().synchronize();
            } catch {
                print("error writing file")
            }
        }
        
        // close picker
        picker.dismissViewControllerAnimated(true){
            
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // close picker
        picker.dismissViewControllerAnimated(true) { 
            
        }
    }
    
    
    @IBAction func tappedBgVariant(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        NSUserDefaults.standardUserDefaults().setInteger(sender.selectedSegmentIndex + 1, forKey: SettingsKey.BG_OPTION.rawValue);
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: SettingsKey.BG_CUSTOM.rawValue);
        
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    @IBAction func tappedBgSwitch(sender: UISwitch){
        print(sender.on);
        
        NSUserDefaults.standardUserDefaults().setBool(sender.on, forKey: SettingsKey.BG.rawValue);
        
        // sincronizeaza setarile diferite pe disc
        // se face modul separat cu user preferences cu setters and getters si se face persist la set
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // change initial value for the background switch
        // bgSwitch.on = false;
        bgSwitch.on = NSUserDefaults.standardUserDefaults().boolForKey(SettingsKey.BG.rawValue);
        
        var selIndex = NSUserDefaults.standardUserDefaults().integerForKey(SettingsKey.BG_OPTION.rawValue)
        
        if (selIndex > 0) {
            selIndex--;
        }
        
        bgVariant.selectedSegmentIndex = selIndex;
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
