import Foundation

class StockMaximize {
    
//    test
    
    var max = 0
    var maxIndex = 0
    var tempPrices = [Int]()
    var profit = 0
    
    func countProfit(prices: [Int]) -> Int {
        
        
            if prices == [Int]() || prices.count == 0 {
                return profit
            }
            
            tempPrices = prices
            removeMaxAtFirstElement(prices: &tempPrices)
            
            if tempPrices.count == 1 {
                return profit
            }
            
            for (index, share) in tempPrices.enumerated() {
                if share <= max && index < maxIndex {
                    profit += max - share
                    tempPrices.removeFirst()
                }
            }
            
            removeMaxAtFirstElement(prices: &tempPrices)
            if tempPrices.count >= 2 {
                countProfit(prices: tempPrices)
            }
            
            return profit
            
        }
        
        func removeMaxAtFirstElement(prices: inout [Int]) {
            if prices.count >= 2 {
                for (index, item) in prices.enumerated() {
                    if item >= max {
                        max = item
                        maxIndex = index
                    }
                }
                
                if maxIndex == 0 {
                    max = 0
                    prices.remove(at: maxIndex)
                    removeMaxAtFirstElement(prices: &prices)
                }
            }
        }
        
    
}
