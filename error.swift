enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

extension String: Error {}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
      throw PrinterError.noToner
    } else if printerName == "Fire!" {
      throw PrinterError.onFire
    } else if printerName == "ABC" {
      throw "String error!!!!!"
    }
    return "Job sent"
}



do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}



do {
    let printerResponse = try send(job: 1440, toPrinter: "ABC")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}



let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print(String(printerSuccess ?? "NIL"))
print(String(printerFailure ?? "NIL"))



var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) throws -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    if fridgeIsOpen {
      let result = fridgeContent.contains(food)
      return result
    }
    throw "Fridge is closed!"
}
let contains = try fridgeContains("eggs")
print(String(contains))
print(fridgeIsOpen)
