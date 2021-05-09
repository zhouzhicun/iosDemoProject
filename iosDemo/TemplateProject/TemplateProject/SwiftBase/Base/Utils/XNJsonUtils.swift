//
//  JsonUtils.swift
//  swiftApp
//
//  Created by zzc on 2020/7/10.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation


//字符串与Data互转
class XNJsonUtils {
    
    static func stringFromData(_ data: Data?) -> String? {
        guard let curData = data else { return nil }
        return String(data: curData, encoding: .utf8)
    }
    
    static func dataFromString(_ str: String?) -> Data? {
        guard let curStr = str else { return nil }
        return curStr.data(using: .utf8)
    }
}

extension XNJsonUtils {
    
    //jsonData -> Model
    static func modelFromJsonData<T: Codable>(_ jsonData: Data?, objType: T.Type) -> T? {
        
        guard let jsonData = jsonData else { return nil }
        let decoder = JSONDecoder()
        let obj = try? decoder.decode(objType, from: jsonData)
        return obj
    }
    
    //jsonString -> Model
    static func modelFromJsonString<T: Codable>(_ jsonString: String?, objType: T.Type) -> T? {
        
        guard let jsonData = dataFromString(jsonString) else { return nil }
        return modelFromJsonData(jsonData, objType: objType)
    }
    
}



extension XNJsonUtils {
    
    //字典 -> Model
    static func modelFromJsonObject<T: Codable>(_ jsonObject: Any?, objType: T.Type) -> T? {
        guard let jsonObj = jsonObject else { return nil }
        guard let data = try? JSONSerialization.data(withJSONObject: jsonObj) else { return nil }
        return modelFromJsonData(data, objType: objType)
    }
    
    
    //字典数组 -> Model数组
    static func modelsFromJsonObjectArr<T: Codable>(_ jsonObjectArr: [Any]?, objType: T.Type) -> [T]? {
        guard let jsonObjArr = jsonObjectArr else { return nil }
        
        var resultArr: [T] = []
        jsonObjArr.forEach { jsonObj in
            if let model = modelFromJsonObject(jsonObj, objType: objType) {
                resultArr.append(model)
            }
        }
        return resultArr
    }
}



//MARK: Model -> JSON

extension XNJsonUtils {
    
    //Model -> JsonData
    static func jsonDataFromModel<T: Codable>(_ model: T?, format: JSONEncoder.OutputFormatting = .prettyPrinted) -> Data? {
        guard let model = model else {
            return nil
        }
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = format
        return try? encoder.encode(model)
    }
    
    //Model -> JsonString
    static func jsonStringFromModel<T: Codable>(_ model: T?, format: JSONEncoder.OutputFormatting = .prettyPrinted) -> String? {
        
        guard let jsonData = jsonDataFromModel(model, format: format) else { return nil }
        return stringFromData(jsonData)
    }
    
    
    static func jsonObjFromModel<T: Codable>(_ model: T?, format: JSONEncoder.OutputFormatting = .prettyPrinted) -> Any? {
        
        guard let jsonData = jsonDataFromModel(model, format: format) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: jsonData) else { return nil }
        return json
    }
    
    static func jsonObjArrFromModelArr<T: Codable>(_ modelArr: [T]?, format: JSONEncoder.OutputFormatting = .prettyPrinted) -> [Any]? {
        guard let curModelArr = modelArr else { return nil }
        var resultArr: [Any] = []
        curModelArr.forEach { model in
            if let obj = jsonObjFromModel(model) {
                resultArr.append(obj)
            }
        }
        return resultArr
    }
}



