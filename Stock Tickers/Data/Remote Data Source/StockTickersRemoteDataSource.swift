//
//  StockTickersRemoteDataSource.swift
//  Stock Tickers
//
//  Created by Peter Bassem on 29/06/2022.
//

import Foundation

class StockTickersRemoteDataSource {
    
    func getStockTickers(fromContentsOfURL urlString: String, encoding: String.Encoding = .utf8, completion: @escaping ([StockTicker]) -> Void) {
        guard let url = URL(string: urlString) else { return }
       // Load the CSV file and parse it
        let delimiter = ","
        var items:[StockTicker]?

        //if let content = String(contentsOfURL: contentsOfURL, encoding: encoding, error: error) {
        if let content = try? String(contentsOf: url as URL, encoding: encoding) {
            items = []
            let lines: [String] = content.components(separatedBy: NSCharacterSet.newlines) as [String]

            for line in lines {
                var values:[String] = []
                if line != "" {
                    // For a line with double quotes
                    // we use NSScanner to perform the parsing
                    if line.range(of: "\"") != nil {
                        var textToScan:String = line
                        var value:NSString?
                        var textScanner: Scanner = Scanner(string: textToScan)
                        while textScanner.string != "" {
                            if (textScanner.string as NSString).substring(to: 1) == "\"" {
                                textScanner.scanLocation += 1
                                textScanner.scanUpTo("\"", into: &value)
                                textScanner.scanLocation += 1
                            } else {
                                textScanner.scanUpTo(delimiter, into: &value)
                            }
                            // Store the value into the values array
                            values.append(value! as String)
                            // Retrieve the unscanned remainder of the string
                            if textScanner.scanLocation < textScanner.string.count {
                                textToScan = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
                            } else {
                                textToScan = ""
                            }
                            textScanner = Scanner(string: textToScan)
                        }

                        // For a line without double quotes, we can simply separate the string
                        // by using the delimiter (e.g. comma)
                    } else  {
                        values = line.components(separatedBy: delimiter)
                    }

                    // Put the values into the tuple and add it to the items array
                    let item = (stock: values[0], price: values[1])
                    items?.append(item)
                }
            }
        }
        completion(items ?? [])
    }
}
