import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
//        SHAME SHAME SHAME SHAME SHAME
        
        
        var tmpStr = ""
        var tempIntstr = "0"
        var tempInt = 0
        var resultStr = ""

        for chr in message {
            if chr.isNumber {
                if tmpStr != "" {
                    for _ in 0 ..< tempInt {
                        resultStr.append(tmpStr)
                    }
                    tmpStr = ""
                    tempIntstr = "0"
                    tempInt = 0
                }
                    tempIntstr.append(chr)
            }
            if chr == "[" && message.first != "[" {
                tempInt = Int(tempIntstr)!
                if tempInt == 0 {
                    resultStr = ""
                    break
                }
                tempIntstr = "0"
            }
            if chr.isLetter {
                if tempInt == 0 {
                    tempInt = 1
                }
                tmpStr.append(chr)
            }
            if chr == "]" {
                for _ in 0 ..< tempInt {
                    resultStr.append(tmpStr)
                }
                tmpStr = ""
                tempIntstr = "0"
                tempInt = 0
            }
        }

        resultStr.append(tmpStr)
        
        return resultStr
    }
}
