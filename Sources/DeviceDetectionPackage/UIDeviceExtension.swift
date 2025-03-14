//
//  UIDeviceExtension.swift
//  SateliteFinder
//
//  Created by Peter Bohl on 11.07.18.
//  Copyright © 2018 Peter Bohl. All rights reserved.
//

//https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model

import Foundation
#if os(iOS)
import UIKit

public enum Model : String {
    case simulator     = "simulator/sandbox",
         //iPod
         iPod1              = "iPod 1",
         iPod2              = "iPod 2",
         iPod3              = "iPod 3",
         iPod4              = "iPod 4",
         iPod5              = "iPod 5",
         iPod6              = "iPod 6",
         iPod7              = "iPod 7",

         //iPad
         iPad2              = "iPad 2",
         iPad3              = "iPad 3",
         iPad4              = "iPad 4",
         iPadAir1           = "iPad Air ",
         iPadAir2           = "iPad Air 2",
         iPadAir3           = "iPad Air 3",
         iPadAir4           = "iPad Air 4",
         iPadAir5           = "iPad Air 5",

         iPad5              = "iPad 5", //iPad 2017
         iPad6              = "iPad 6", //iPad 2018
         iPad7              = "iPad 7", //iPad 2019
         iPad8              = "iPad 8", //iPad 2020
         iPad9              = "iPad 9", //iPad 2021
         iPad10             = "iPad 10",//iPad 2022
         

         //iPad Mini
         iPadMini1          = "iPad Mini",
         iPadMini2          = "iPad Mini 2",
         iPadMini3          = "iPad Mini 3",
         iPadMini4          = "iPad Mini 4",
         iPadMini5          = "iPad Mini 5",

         //iPad Pro
         iPadPro9_7         = "iPad Pro 9.7\"",
         iPadPro10_5        = "iPad Pro 10.5\"",
         iPadPro11          = "iPad Pro 11\"",
         iPadPro2_11        = "iPad Pro 11\" 2nd gen",
         iPadPro12_9        = "iPad Pro 12.9\"",
         iPadPro2_12_9      = "iPad Pro 2 12.9\"",
         iPadPro3_12_9      = "iPad Pro 3 12.9\"",
         iPadPro4_12_9      = "iPad Pro 4 12.9\"",

         //iPhone
         iPhone4            = "iPhone 4",
         iPhone4S           = "iPhone 4S",
         iPhone5            = "iPhone 5",
         iPhone5S           = "iPhone 5S",
         iPhone5C           = "iPhone 5C",
         iPhone6            = "iPhone 6",
         iPhone6Plus        = "iPhone 6 Plus",
         iPhone6S           = "iPhone 6S",
         iPhone6SPlus       = "iPhone 6S Plus",
         iPhoneSE           = "iPhone SE",
         iPhone7            = "iPhone 7",
         iPhone7Plus        = "iPhone 7 Plus",
         iPhone8            = "iPhone 8",
         iPhone8Plus        = "iPhone 8 Plus",
         iPhoneX            = "iPhone X",
         iPhoneXS           = "iPhone XS",
         iPhoneXSMax        = "iPhone XS Max",
         iPhoneXR           = "iPhone XR",
         iPhone11           = "iPhone 11",
         iPhone11Pro        = "iPhone 11 Pro",
         iPhone11ProMax     = "iPhone 11 Pro Max",
         iPhoneSE2          = "iPhone SE 2nd gen",
         iPhone12Mini       = "iPhone 12 Mini",
         iPhone12           = "iPhone 12",
         iPhone12Pro        = "iPhone 12 Pro",
         iPhone12ProMax     = "iPhone 12 Pro Max",
         iPhone13Mini       = "iPhone 13 mini",
         iPhone13           = "iPhone 13",
         iPhone13Pro        = "iPhone 13 Pro",
         iPhone13ProMax     = "iPhone 13 Pro Max",
         iPhone14           = "iPhone 14",
         iPhone14Plus       = "iPhone 14 Plus",
         iPhone14Pro        = "iPhone 14 Pro",
         iPhone14ProMax     = "iPhone 14 Pro Max",
         iPhone15           = "iPhone 15",
         iPhone15Plus       = "iPhone 15 Plus",
         iPhone15Pro        = "iPhone 15 Pro",
         iPhone15ProMax     = "iPhone 15 Pro Max",
         iPhone16           = "iPhone 16",
         iPhone16Plus       = "iPhone 16 Plus",
         iPhone16Pro        = "iPhone 16 Pro",
         iPhone16ProMax     = "iPhone 16 Pro Max",
         iPhone16e          = "iPhone 16e",
         iPhoneSE3rdGeneration = "iPhone SE 3rd generation",

         // Apple Watch
         AppleWatch1         = "Apple Watch 1gen",
         AppleWatchS1        = "Apple Watch Series 1",
         AppleWatchS2        = "Apple Watch Series 2",
         AppleWatchS3        = "Apple Watch Series 3",
         AppleWatchS4        = "Apple Watch Series 4",
         AppleWatchS5        = "Apple Watch Series 5",
         AppleWatchSE        = "Apple Watch Special Edition",
         AppleWatchS6        = "Apple Watch Series 6",

         //Apple TV
         AppleTV1           = "Apple TV 1gen",
         AppleTV2           = "Apple TV 2gen",
         AppleTV3           = "Apple TV 3gen",
         AppleTV4           = "Apple TV 4gen",
         AppleTV_4K         = "Apple TV 4K",
         
         unrecognized       = "?unrecognized?"
}



public extension UIDevice
{
    var type: Model
    {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine)
        {
            $0.withMemoryRebound(to: CChar.self, capacity: 1)
            {
                ptr in String.init(validatingUTF8: ptr)
                
            }
        }
        let modelMap : [ String : Model ] = [
            //Simulator
                    "i386"      : .simulator,
                    "x86_64"    : .simulator,
                    "arm64"     : .simulator,

                    //iPod
                    "iPod1,1"   : .iPod1,
                    "iPod2,1"   : .iPod2,
                    "iPod3,1"   : .iPod3,
                    "iPod4,1"   : .iPod4,
                    "iPod5,1"   : .iPod5,
                    "iPod7,1"   : .iPod6,
                    "iPod9,1"   : .iPod7,

                    //iPad
                    "iPad2,1"   : .iPad2,
                    "iPad2,2"   : .iPad2,
                    "iPad2,3"   : .iPad2,
                    "iPad2,4"   : .iPad2,
                    "iPad3,1"   : .iPad3,
                    "iPad3,2"   : .iPad3,
                    "iPad3,3"   : .iPad3,
                    "iPad3,4"   : .iPad4,
                    "iPad3,5"   : .iPad4,
                    "iPad3,6"   : .iPad4,
                    "iPad6,11"  : .iPad5, //iPad 2017
                    "iPad6,12"  : .iPad5,
                    "iPad7,5"   : .iPad6, //iPad 2018
                    "iPad7,6"   : .iPad6,
                    "iPad7,11"  : .iPad7, //iPad 2019
                    "iPad7,12"  : .iPad7,
                    "iPad11,6"  : .iPad8, //iPad 2020
                    "iPad11,7"  : .iPad8,
                    "iPad12,1"  : .iPad9,
                    "iPad12,2"  : .iPad9,
                    "iPad13,19"  : .iPad10,
                    "iPad13,20"  : .iPad10,

                    //iPad Mini
                    "iPad2,5"   : .iPadMini1,
                    "iPad2,6"   : .iPadMini1,
                    "iPad2,7"   : .iPadMini1,
                    "iPad4,4"   : .iPadMini2,
                    "iPad4,5"   : .iPadMini2,
                    "iPad4,6"   : .iPadMini2,
                    "iPad4,7"   : .iPadMini3,
                    "iPad4,8"   : .iPadMini3,
                    "iPad4,9"   : .iPadMini3,
                    "iPad5,1"   : .iPadMini4,
                    "iPad5,2"   : .iPadMini4,
                    "iPad11,1"  : .iPadMini5,
                    "iPad11,2"  : .iPadMini5,

                    //iPad Pro
                    "iPad6,3"   : .iPadPro9_7,
                    "iPad6,4"   : .iPadPro9_7,
                    "iPad7,3"   : .iPadPro10_5,
                    "iPad7,4"   : .iPadPro10_5,
                    "iPad6,7"   : .iPadPro12_9,
                    "iPad6,8"   : .iPadPro12_9,
                    "iPad7,1"   : .iPadPro2_12_9,
                    "iPad7,2"   : .iPadPro2_12_9,
                    "iPad8,1"   : .iPadPro11,
                    "iPad8,2"   : .iPadPro11,
                    "iPad8,3"   : .iPadPro11,
                    "iPad8,4"   : .iPadPro11,
                    "iPad8,9"   : .iPadPro2_11,
                    "iPad8,10"  : .iPadPro2_11,
                    "iPad8,5"   : .iPadPro3_12_9,
                    "iPad8,6"   : .iPadPro3_12_9,
                    "iPad8,7"   : .iPadPro3_12_9,
                    "iPad8,8"   : .iPadPro3_12_9,
                    "iPad8,11"  : .iPadPro4_12_9,
                    "iPad8,12"  : .iPadPro4_12_9,

                    //iPad Air
                    "iPad4,1"   : .iPadAir1,
                    "iPad4,2"   : .iPadAir1,
                    "iPad4,3"   : .iPadAir1,
                    "iPad5,3"   : .iPadAir2,
                    "iPad5,4"   : .iPadAir2,
                    "iPad11,3"  : .iPadAir3,
                    "iPad11,4"  : .iPadAir3,
                    "iPad13,1"  : .iPadAir4,
                    "iPad13,2"  : .iPadAir4,
                    "iPad13,15" : .iPadAir5,
                    "iPad13,16" : .iPadAir5,

                    

                    //iPhone
                    "iPhone3,1" : .iPhone4,
                    "iPhone3,2" : .iPhone4,
                    "iPhone3,3" : .iPhone4,
                    "iPhone4,1" : .iPhone4S,
                    "iPhone5,1" : .iPhone5,
                    "iPhone5,2" : .iPhone5,
                    "iPhone5,3" : .iPhone5C,
                    "iPhone5,4" : .iPhone5C,
                    "iPhone6,1" : .iPhone5S,
                    "iPhone6,2" : .iPhone5S,
                    "iPhone7,1" : .iPhone6Plus,
                    "iPhone7,2" : .iPhone6,
                    "iPhone8,1" : .iPhone6S,
                    "iPhone8,2" : .iPhone6SPlus,
                    "iPhone8,4" : .iPhoneSE,
                    "iPhone9,1" : .iPhone7,
                    "iPhone9,3" : .iPhone7,
                    "iPhone9,2" : .iPhone7Plus,
                    "iPhone9,4" : .iPhone7Plus,
                    "iPhone10,1" : .iPhone8,
                    "iPhone10,4" : .iPhone8,
                    "iPhone10,2" : .iPhone8Plus,
                    "iPhone10,5" : .iPhone8Plus,
                    "iPhone10,3" : .iPhoneX,
                    "iPhone10,6" : .iPhoneX,
                    "iPhone11,2" : .iPhoneXS,
                    "iPhone11,4" : .iPhoneXSMax,
                    "iPhone11,6" : .iPhoneXSMax,
                    "iPhone11,8" : .iPhoneXR,
                    "iPhone12,1" : .iPhone11,
                    "iPhone12,3" : .iPhone11Pro,
                    "iPhone12,5" : .iPhone11ProMax,
                    "iPhone12,8" : .iPhoneSE2,

                    "iPhone13,1" : .iPhone12Mini,
                    "iPhone13,2" : .iPhone12,
                    "iPhone13,3" : .iPhone12Pro,
                    "iPhone13,4" : .iPhone12ProMax,

                    "iPhone14,4":  .iPhone13Mini,
                    "iPhone14,5":  .iPhone13,
                    "iPhone14,2":  .iPhone13Pro,
                    "iPhone14,3":  .iPhone13ProMax,
                    "iPhone14,6" : .iPhoneSE3rdGeneration,

                    "iPhone14,7":  .iPhone14,
                    "iPhone14,8":  .iPhone14Plus,
                    "iPhone15,2":  .iPhone14Pro,
                    "iPhone15,3":  .iPhone14ProMax,

                    "iPhone15,4":  .iPhone15,
                    "iPhone15,5":  .iPhone15Plus,
                    "iPhone16,1":  .iPhone15Pro,
                    "iPhone16,2":  .iPhone15ProMax,

                    "iPhone17,3":  .iPhone16,
                    "iPhone17,4":  .iPhone16Plus,
                    "iPhone17,1":  .iPhone16Pro,
                    "iPhone17,2":  .iPhone16ProMax,
                    "iPhone17,5":  .iPhone16e,


                    
                    // Apple Watch
                    "Watch1,1" : .AppleWatch1,
                    "Watch1,2" : .AppleWatch1,
                    "Watch2,6" : .AppleWatchS1,
                    "Watch2,7" : .AppleWatchS1,
                    "Watch2,3" : .AppleWatchS2,
                    "Watch2,4" : .AppleWatchS2,
                    "Watch3,1" : .AppleWatchS3,
                    "Watch3,2" : .AppleWatchS3,
                    "Watch3,3" : .AppleWatchS3,
                    "Watch3,4" : .AppleWatchS3,
                    "Watch4,1" : .AppleWatchS4,
                    "Watch4,2" : .AppleWatchS4,
                    "Watch4,3" : .AppleWatchS4,
                    "Watch4,4" : .AppleWatchS4,
                    "Watch5,1" : .AppleWatchS5,
                    "Watch5,2" : .AppleWatchS5,
                    "Watch5,3" : .AppleWatchS5,
                    "Watch5,4" : .AppleWatchS5,
                    "Watch5,9" : .AppleWatchSE,
                    "Watch5,10" : .AppleWatchSE,
                    "Watch5,11" : .AppleWatchSE,
                    "Watch5,12" : .AppleWatchSE,
                    "Watch6,1" : .AppleWatchS6,
                    "Watch6,2" : .AppleWatchS6,
                    "Watch6,3" : .AppleWatchS6,
                    "Watch6,4" : .AppleWatchS6,

                    //Apple TV
                    "AppleTV1,1" : .AppleTV1,
                    "AppleTV2,1" : .AppleTV2,
                    "AppleTV3,1" : .AppleTV3,
                    "AppleTV3,2" : .AppleTV3,
                    "AppleTV5,3" : .AppleTV4,
                    "AppleTV6,2" : .AppleTV_4K
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!]
        {
            if model == .simulator
            {
                if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]
                {
                    if let simModel = modelMap[String.init(validatingUTF8: simModelCode)!]
                    {
                        return simModel
                    }
                }
            }
            return model
        }
        return Model.unrecognized
    }
    
    var iPad : Bool
    {
        get
        {
          
            let st = self.type.rawValue.lowercased()
            
            if self.type.rawValue.lowercased().starts(with: "ipad")
            {
                return true
            }
            else
            {
                return false

            }
        }
    }
    
    var iPhone : Bool
    {
        get
        {
          
            
            if self.type.rawValue.lowercased().starts(with: "iphone")
            {
                return true
            }
            else
            {
                return false

            }
        }
    }

    var iPod : Bool
    {
        get
        {
            if self.type.rawValue.lowercased().starts(with: "ipod")
            {
                return true
            }
            else
            {
                return false

            }
        }
    }
    
    var maxDevice: Bool
    {
        get
        {
            switch self.type
            {

            case .iPhone16Plus:
                return true
            case .iPhone16ProMax:
                return true
            case .iPhone15Plus:
                return true
            case .iPhone15ProMax:
                return true
            case .iPhone14Plus:
                return true
            case .iPhone14ProMax:
                return true
            case .iPhone13ProMax:
                return true
            case .iPhone12ProMax:
                return true
            case .iPhone11ProMax:
                return true
            case .iPhoneXSMax:
                return true
            default:
                return false
            }
        }
    }
    
    var bigDevice: Bool
    {
        get
        {
            switch self.type
            {
            case .iPhone6Plus:
                fallthrough
            case .iPhone6SPlus:
                fallthrough
            case .iPhone7Plus:
                fallthrough
            case .iPhoneX:
                fallthrough
            case .iPhoneXS:
                fallthrough
            case .iPhoneXR:
                fallthrough
            case .iPhone11:
                fallthrough
            case .iPhone11Pro:
                fallthrough

            case .iPhone12:
                fallthrough
            case .iPhone12Pro:
                fallthrough
            case .iPhone8Plus:
                fallthrough

            case .iPhone13:
                return true
            case .iPhone13Pro:
                return true

            case .iPhone13:
                return true
            case .iPhone14:
                return true
            case .iPhone14Pro:
                return true


            case .iPhone15:
                return true
            case .iPhone15Pro:
                return true


            case .iPhone16:
                return true
            case .iPhone16Pro:
                return true



            default:
                return false
            }
        }
    }

    var midDevice : Bool
    {
        get
        {
            switch self.type
            {
            case .iPhone6:
                fallthrough
            case .iPhone6S:
                fallthrough
            case .iPhone7:
                fallthrough
            case .iPhone7:
                fallthrough
            case .iPhone8:
                fallthrough
            case .iPhone13Mini:
                return true
            case .iPhone16e:
                return true
            default:
                return false
            }
        }
    }
   
    var smallDevice : Bool
    {
        get
        {
            switch self.type
            {
            case .iPhone4:
                fallthrough
            case .iPhone5:
                fallthrough
            case .iPhone5S:
                fallthrough
                fallthrough
            case .iPhoneSE:
                fallthrough
            case .iPhoneSE:
                fallthrough
            case .iPhoneSE3rdGeneration:
                fallthrough
            case .iPhone4S:
                return true
                
                
            default:
                return false
            }
            
        }
    }

}
#endif
