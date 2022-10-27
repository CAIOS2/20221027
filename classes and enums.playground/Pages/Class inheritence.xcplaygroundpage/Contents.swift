class Item {
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    func viewDescription() {
        print("Item: \(self.title). Description: \(self.description)")
    }
}

class Book : Item {
    var author: String
    var isbn: String
    
    init(title: String, description: String, author: String, isbn: String) {
        self.author = author
        self.isbn = isbn
        
        super.init(title: title, description: description)
    }
    
    override func viewDescription() {
        print("Book: \(self.title), \(self.description), \(self.author), \(self.isbn)")
    }
}

class DVD: Item {
    var director: String
    var certificate: String
    
    init(title: String, description: String, director: String, certificate: String) {
        self.director = director
        self.certificate = certificate
        
        super.init(title: title, description: description)
    }
    
    override func viewDescription() {
        print("DVD: \(self.title), \(self.description), \(self.director), \(self.certificate)")
    }
}

class CD: Item {
    var artist: String
    var genre: String
    var numberOfTracks: Int
    
    init(title: String, description: String, artist: String, genre: String, numberOfTracks: Int) {
        self.artist = artist
        self.numberOfTracks = numberOfTracks
        self.genre = genre
        
        super.init(title: title, description: description)
    }
    
    override func viewDescription() {
        print("CD: \(self.title), \(self.description), \(self.artist), \(self.genre), \(self.numberOfTracks)")
    }
}

class Library {
    var items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func removeItem(title: String) {
        var i = 0
        for each in items {
            if each.title == title {
                self.items.remove(at: i)
            }
            i += 1
        }
    }
    
    func listItems() {
        for each in items {
            each.viewDescription()
        }
    }
    
    func numberOfItems() {
        print(self.items.count)
    }
    
    func reset() {
        self.items = []
    }
    
    func isEmpty() -> Bool {
        return self.items.isEmpty
    }
}


let depecheModeCD = CD(title: "Silent",
                       description: "No description",
                       artist: "Depeche",
                       genre: "electronic",
                       numberOfTracks: 12)

depecheModeCD.viewDescription()
