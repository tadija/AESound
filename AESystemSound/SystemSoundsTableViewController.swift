/**
 *  https://github.com/tadija/AESystemSound
 *  Copyright (c) Marko Tadić 2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import UIKit

public final class SystemSoundsTableViewController: UITableViewController {

    // MARK: Properties

    private let systemSoundsDirectoryURL = URL(string: "/System/Library/Audio/UISounds/")!
    private lazy var directories: [URL] = { [systemSoundsDirectoryURL] }()
    private var files = [URL]()
    private var sounds = [String: [URL]]()

    // MARK: Lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        loadPaths()
        loadSounds()
        printPathEnum()
    }

    // MARK: UITableViewDataSource

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return directories.count
    }

    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return directories[section].path
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = directories[section].path
        return sounds[key]?.count ?? 0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemSoundCell", for: indexPath)
        if let soundURL = soundURL(for: indexPath) {
            cell.textLabel?.text = soundURL.lastPathComponent
            cell.detailTextLabel?.text = "\(indexPath.row + 1)"
        }
        return cell
    }

    // MARK: UITableViewDelegate

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let soundURL = soundURL(for: indexPath) {
            AESystemSound.play(fromPath: soundURL.path)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // MARK: Helpers

    /// - Attention: This method will only work on the real device, not on simulator!
    func loadPaths() {
        let keys = [URLResourceKey.isDirectoryKey]
        let enumerator = FileManager.default.enumerator(at: systemSoundsDirectoryURL, includingPropertiesForKeys: keys)
        enumerator?.forEach { (item) in
            guard let url = item as? URL else { return }
            do {
                let resource = try url.resourceValues(forKeys: Set(keys))
                guard let isDirectory = resource.isDirectory else { return }
                isDirectory ? directories.append(url) : files.append(url)
            } catch {
                print(error)
            }
        }
    }

    func loadSounds() {
        directories.forEach{
            let path = $0.path
            let soundsAtPath = files.filter { $0.deletingLastPathComponent().path == path }
            sounds[path] = soundsAtPath
        }
    }

    func soundURL(for indexPath: IndexPath) -> URL? {
        let path = directories[indexPath.section].path
        let sortedSounds = sounds[path]?.sorted {
            $0.path.localizedCaseInsensitiveCompare($1.path) == .orderedAscending
        }
        let soundURL = sortedSounds?[indexPath.row]
        return soundURL
    }

    func printPathEnum() {
        var text = "public enum Path: String {\n"
        let pathURLs = sounds.keys.map { URL(fileURLWithPath: $0, isDirectory: true) }
        let sortedPathURLs = pathURLs.sorted {
            $0.lastPathComponent.localizedCaseInsensitiveCompare($1.lastPathComponent) == .orderedAscending
        }
        sortedPathURLs.forEach { (pathURL) in
            if let urls = sounds[pathURL.path] {
                let groupName = pathURL.lastPathComponent.lowercased()
                let sortedURLs = urls.sorted {
                    $0.path.localizedCaseInsensitiveCompare($1.path) == .orderedAscending
                }
                sortedURLs.forEach{ (url) in
                    let soundName = url.deletingPathExtension().lastPathComponent
                        .replacingOccurrences(of: "-", with: "_")
                        .replacingOccurrences(of: "~", with: "_").lowercased()
                    let caseText = "\tcase \(groupName)_\(soundName) = \"\(url.path)\"\n"
                    text += caseText
                }
            }
        }
        text += "}"
        print(text)
    }

}
