/**
 *  https://github.com/tadija/AESound
 *  Copyright (c) Marko Tadić 2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import UIKit

public final class SystemSoundsTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    private enum Framework: String {
        case AudioToolbox
        case AVFoundation
    }

    // MARK: Properties

    private let systemSoundsDirectoryURL = URL(string: "/System/Library/Audio/UISounds/")!
    private var directories = [URL]()
    private var files = [URL]()
    private var sounds = [String: [URL]]()

    private let searchController = UISearchController(searchResultsController: nil)
    private var searchResults = [URL]()
    private var isSearching = false

    private var framework = Framework.AudioToolbox
    private let output = AESound()
    private lazy var toggleFrameworkButton: UIBarButtonItem = {
         UIBarButtonItem(title: "Toggle Framework", style: .plain, target: self, action: #selector(toggleFramework(_:)))
    }()

    // MARK: Lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        loadData()
    }

    // MARK: Actions

    @objc
    private func toggleFramework(_ sender: UIBarButtonItem) {
        switch framework {
        case .AudioToolbox:
            framework = .AVFoundation
        case .AVFoundation:
            framework = .AudioToolbox
        }
        title = framework.rawValue
    }

    // MARK: UITableViewDataSource

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return isSearching ? 1 : directories.count
    }

    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return isSearching ? nil : directories[section].path
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchResults.count
        } else {
            let key = directories[section].path
            return sounds[key]?.count ?? 0
        }
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemSoundCell", for: indexPath)
        cell.textLabel?.text = soundURL(for: indexPath)?.lastPathComponent ?? "n/a"
        return cell
    }

    // MARK: UITableViewDelegate

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let soundURL = soundURL(for: indexPath) {
            switch framework {
            case .AudioToolbox:
                output.playSystemSound(atPath: soundURL.path)
            case .AVFoundation:
                output.playSound(atPath: soundURL.path)
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // MARK: UISearchResultsUpdating

    public func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            searchResults = files.filter { $0.path.lowercased().contains(searchText.lowercased()) }
            isSearching = true
        } else {
            isSearching = false
        }
        tableView.reloadData()
    }

    // MARK: UISearchBarDelegate

    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        tableView.reloadData()
    }

    // MARK: Helpers

    private func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true

        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true

        navigationItem.rightBarButtonItem = toggleFrameworkButton
    }

    private func loadData() {
        loadPaths()
        loadSounds()
        printPathEnum()
    }

    /// - Attention: This method will only work on the real device, not on simulator!
    func loadPaths() {
        directories = [systemSoundsDirectoryURL]
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

    func soundURL(for indexPath: IndexPath) -> URL? {
        if isSearching {
            return searchResults[indexPath.row]
        } else {
            let path = directories[indexPath.section].path
            let sortedSounds = sounds[path]?.sorted {
                $0.path.localizedCaseInsensitiveCompare($1.path) == .orderedAscending
            }
            let soundURL = sortedSounds?[indexPath.row]
            return soundURL
        }
    }

}
