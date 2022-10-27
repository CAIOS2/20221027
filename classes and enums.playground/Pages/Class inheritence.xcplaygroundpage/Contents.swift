
//MARK: - Parent Class -

class Item {
    let title: String
    let description: String
    
    init(itemTitle: String, itemDescription: String) {
        self.title = itemTitle
        self.description = itemDescription
    }
    
    func viewDescription() { print("Child missed to override method") }
}

//MARK: - Child Classes -

class Book: Item {
    let author: String
    let isbn: String
    
    init(bookTitle: String, bookDescription: String, bookAuthor: String, bookIsbn: String) {
        self.author = bookAuthor
        self.isbn = bookIsbn
        
        super.init(itemTitle: bookTitle, itemDescription: bookDescription)
    }
    
    override func viewDescription() {
        print("This book is named \(title) of \(description). Written by \(author). You can buy by searching for ISBN: \(isbn)")
    }
}

class DVD: Item {
    let director: String
    let certificate: String
    
    init(dvdTitle: String, dvdDescription: String, dvdDirector: String, dvdCertificate: String) {
        self.director = dvdDirector
        self.certificate = dvdCertificate
        
        super.init(itemTitle: dvdTitle, itemDescription: dvdDescription)
    }
    
    override func viewDescription() {
        print("Movie \(title). \(description). Movie director is \(director). DVD certified \(certificate)")
    }
}

class CD: Item {
    let artist: String
    let genre: String
    let numberOfTracks: Int
    
    init(cdTitle: String, cdDescription: String, cdArtist: String, cdGenre: String, numberOfCDTracks: Int) {
        self.artist = cdArtist
        self.genre = cdGenre
        self.numberOfTracks = numberOfCDTracks
        
        super.init(itemTitle: cdTitle, itemDescription: cdDescription)
    }
    
    override func viewDescription() {
        print("Music title: \(title) about \(description). Artist \(artist) of genre \(genre). Contains \(numberOfTracks) \(numberOfTracks > 1 ? "tracks" : "track")")
    }
}


//MARK: - Library -

class Library {
    private var items: [Item] = []
    
    func addItem(_ item: Item) {
        items.append(item)
    }
    
    func removeItem(_ item: Item) {
        if let index = items.firstIndex(where: { $0.title == item.title } ) {
            let removedItem = items.remove(at: index)
            print("We successfully removed item \(removedItem.title)")
        } else {
            print("We don't have this item on the list")
        }
    }
    
    func listItems() {
        items.enumerated().forEach { index, item in
            print("Description of the item at \(index):")
            item.viewDescription()
        }
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func reset() {
        return items = []
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}

//MARK: - Testing -

let item1 = CD(cdTitle: "Silent",
               cdDescription: "No description",
               cdArtist: "Depeche",
               cdGenre: "electronic",
               numberOfCDTracks: 0)

let item2 = DVD(dvdTitle: "Matrix", dvdDescription: "Trinity and Neo shooting and flying", dvdDirector: "Wachovskei", dvdCertificate: "golden")

let item3 = Book(bookTitle: "Ziedu valdovas", bookDescription: "Nykstukai ir elfai", bookAuthor: "Tolk", bookIsbn: "Labai geras ISBNS")

let biblioteka = Library()

biblioteka.addItem(item1); biblioteka.addItem(item2); biblioteka.addItem(item3)

biblioteka.listItems()
biblioteka.removeItem(item3)
biblioteka.removeItem(item3)
print("Number of items \(biblioteka.numberOfItems())")
print("Library is \(biblioteka.isEmpty() ? "empty" : "occupied")")
biblioteka.reset()
print("Number of items \(biblioteka.numberOfItems())")
print("Library is \(biblioteka.isEmpty() ? "empty" : "occupied")")


