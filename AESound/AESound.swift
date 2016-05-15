//
//  AESound.swift
//  Touch League
//
//  Created by Marko Tadic on 5/15/16.
//  Copyright © 2016 AE. All rights reserved.
//

import AudioToolbox
import UIKit

// MARK: - AESound

public class AESound {
    
    public class func play(soundPath: String) {
        var soundID: SystemSoundID = 0
        let pathURL = NSURL(fileURLWithPath: soundPath)
        AudioServicesCreateSystemSoundID(pathURL as CFURLRef, &soundID)
        play(soundID)
    }
    
    public class func play(soundID: SystemSoundID) {
        AudioServicesPlaySystemSound(soundID)
    }
    
}

// MARK: - AESoundTableViewController

public class AESoundTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var urls = [NSURL]()
    
    /// - NOTE: This method will only work on device, not on simulator!
    func loadPaths() {
        let fileManager = NSFileManager.defaultManager()
        let keys = [NSURLIsDirectoryKey]
        
        guard let
            url = NSURL(string: "/System/Library/Audio/UISounds"),
            enumerator = fileManager.enumeratorAtURL(url, includingPropertiesForKeys: keys, options: [], errorHandler: nil)
        else { return }
        
        for object in enumerator {
            guard let url = object as? NSURL else { return }
            do {
                var resource: AnyObject?
                try url.getResourceValue(&resource, forKey: NSURLIsDirectoryKey)
                guard let isDirectory = (resource as? NSNumber)?.boolValue else { return }
                if !isDirectory { urls.append(url) }
            } catch { print(error) }
        }
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        loadPaths()
    }
    
    // MARK: - UITableViewDataSource
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") ?? defaultCell
        
        let url = urls[indexPath.row]
        
        cell.textLabel?.text = url.lastPathComponent
        cell.detailTextLabel?.text = url.path
        
        return cell
    }
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let path = urls[indexPath.row].path else { return }
        AESound.play(path)
    }
    
}
