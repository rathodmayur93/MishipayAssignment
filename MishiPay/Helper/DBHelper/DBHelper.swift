//
//  DBHelper.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import Foundation

import Foundation
import SQLite3

class DBHelper
{
    init()
    {
        db = openDatabase()
        createTable()
    }

    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?

    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS product(Id INTEGER PRIMARY KEY,title TEXT,price DOUBLE,image TEXT, barcode TEXT, isInCart INTEGER);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                debugPrint("Product table created.")
            } else {
                debugPrint("Product table could not be created.")
            }
        } else {
            debugPrint("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insert(id : Int, title : String, price : Int, image : String, barcode: String, isInCart : Int)
    {
        let product = read()
        for p in product
        {
            if p.id == id
            {
                return
            }
        }
        let insertStatementString = "INSERT INTO product (Id, title, price, image, barcode, isInCart) VALUES (?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (title as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(price))
            sqlite3_bind_text(insertStatement, 4, (image as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (barcode as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 6, Int32(isInCart))
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                debugPrint("Successfully inserted row.")
            } else {
                debugPrint("Could not insert row.")
            }
        } else {
            debugPrint("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func read() -> [Product] {
        let queryStatementString = "SELECT * FROM product WHERE isInCart = 1;"
        var queryStatement: OpaquePointer? = nil
        var psns : [Product] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let title = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let price = sqlite3_column_int(queryStatement!, 2)
                let image = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let barcode = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let isInCart = sqlite3_column_int(queryStatement!, 5)
                
                psns.append(Product(id: Int(id), title: title, price: Int(price), image: image, barcode: barcode, isInCart: Int(isInCart)))
                debugPrint("Query Result:")
                debugPrint("\(id) | \(title) | \(price)| \(image)| \(isInCart)| \(barcode)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    func deleteByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM product WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                debugPrint("Successfully deleted row.")
            } else {
                debugPrint("Could not delete row.")
            }
        } else {
            debugPrint("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    func addProductInCart(barcode : String){
        let updateStatementStirng = "UPDATE product SET isInCart = 1 WHERE barcode = ?;"
        var updateStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStatementStirng, -1, &updateStatement, nil) == SQLITE_OK {
            //sqlite3_bind_int(updateStatement, 1, Int32(barcode) ?? 0)
            sqlite3_bind_text(updateStatement, 1, (barcode as NSString).utf8String, -1, nil)
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                debugPrint("Successfully updated row.")
            } else {
                debugPrint("Could not udpate row.")
            }
        } else {
            debugPrint("UPDATE statement could not be prepared")
        }
        sqlite3_finalize(updateStatement)
    }
    
    func removeProductFromCart(barcode : String){
        let updateStatementStirng = "UPDATE product SET isInCart = 0 WHERE barcode = ?;"
        var updateStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStatementStirng, -1, &updateStatement, nil) == SQLITE_OK {
            //sqlite3_bind_int(updateStatement, 1, Int32(barcode) ?? 0)
            sqlite3_bind_text(updateStatement, 1, (barcode as NSString).utf8String, -1, nil)
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                debugPrint("Successfully updated row.")
            } else {
                debugPrint("Could not udpate row.")
            }
        } else {
            debugPrint("UPDATE statement could not be prepared")
        }
        sqlite3_finalize(updateStatement)
    }
    
}
