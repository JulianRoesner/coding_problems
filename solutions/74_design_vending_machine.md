# Desing a vending machine

## Model
Classes for representing our data model

### Class: VendingMachineModel
- ProductsAmount: [(Product, Int)]
- CurrentRequest: Request
- AcceptedCoins: [Int]

### Class: ProductModel
- Name: String
- Price: Int (in cents)

### Class: RequestModel
- SelectedProducts: [Products]
- Prize: Int (in cents)

## View
Classes for representing the view for the user

### Class: VendingMachineView
- func showProducts()
- func showPrice(Product prod)
- func showRequest(Request req)
- func showRefund(Int refund)

## Controller
Classes for manipulating data

### Class: VendingMachineController
- func addProduct(Product prod)
- func createRequest()
- func addProductToRequest(Product choice)
- func cancelRequest()
- fuc pay(Int amount)

### Class: RequestModel
- func cancel()
- func pay()
- func addProduct()