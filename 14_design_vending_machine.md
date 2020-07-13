# How do you design a vending machine

## Preparations
- Ask questions
    - Who is user
    - What will be sold
    - Will it be possible to change this later in use
    - How is payment made
    - Can more than one item be sold in one purchase
- Begin with tests according to use cases

## Classes
- VendingMachine
    - [Item] items
    - Purchase currentPurchase
    - [Int] acceptableCoins
- Purchase
    -  [Item] items
    -  Bool done
    -  func getPrice() -> Int
    -  func complete()->()
- Item
    - Int price
    - String name
- VendingMachineController 
    - VendingMachineView view
    - VendingMachine vendingMachine
    - func addItem(Item i) -> ()
    - func deleteItem(Item i) -> ()
    - func cancelRequest() -> ()
    - func resetMachine () -> ()
    - func pay(Int amount) -> ()
- VendingMachineView
    - func showItems()->()
    - func showPurchase()->()
    - func showPaymentScreen()->()
