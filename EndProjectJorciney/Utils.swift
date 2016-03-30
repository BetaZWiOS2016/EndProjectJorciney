//
//  Utils.swift
//  EndProjectJorciney
//
//  Created by user116613 on 3/30/16.
//  Copyright © 2016 user116613. All rights reserved.
//

import Foundation

func isStringAlreadyPresentInArray(str : String, array:[String])->Bool{
    let found = array.contains({ (otherString) -> Bool in
        str == otherString
    })
    return found;
}
func getFormatedDate(date: NSDate)->String{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
    dateFormatter.dateFormat="dd/MM/yyyy"
    return dateFormatter.stringFromDate(date)
}

func getParsedNSDateFromString(dateStr:String) -> NSDate {
    let dateFmt = NSDateFormatter()
    dateFmt.timeZone = NSTimeZone.defaultTimeZone()
    dateFmt.dateFormat = "dd/MM/yyyy"
    return dateFmt.dateFromString(dateStr)!
}
