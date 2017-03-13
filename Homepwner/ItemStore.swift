//
//  Copyright © 2015 Big Nerd Ranch
//

import Foundation

class ItemStore {
    
    var allItems: [Item] = []
    
    init() {
        //
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems = archivedItems
        }
    }
    
    //Constructs a URL file
    let itemArchiveURL: URL = {
        //.url method searches the filesystem for a URL that meets the criteria given by the arguments
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
            return
        documentDirectory.appendingPathComponent("items.archive")
    }()
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return
        //ArchiverootObject takes care of saving every single Item in allItems to itemArchiveURL
    NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
//    init() {
//          for _ in 0..<5 {
//              createItem()
//          }
//    }
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        //Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        //remove item from array
        allItems.remove(at: fromIndex)
        //Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
