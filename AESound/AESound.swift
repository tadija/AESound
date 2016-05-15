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
    
    var paths = [String]()
    
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
                if !isDirectory {
                    guard let path = url.path else { return }
                    paths.append(path)
                }
            } catch {
                print(error)
            }
        }
        
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPaths()
        print(paths)
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paths.count
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let path = paths[indexPath.row]
        cell.textLabel?.text = path
        return cell
    }
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let path = paths[indexPath.row]
        AESound.play(path)
    }
    
}
