//
//  DeeplinkBuilder.swift
//  linkid_mmp
//
//  Created by Tuan Dinh on 28/09/2023.
//

import Foundation

public class DeepLinkBuilder {
    public var iOSParameters: DeepLinkIOSParameters?
    public var androidParameters: DeepLinkAndroidParameters?
    public var airflexParameters: DeepLinkAirflexParameters?
    
    public init() {
    }
    
    func buildParams() -> [String: Any] {
        var params: [String: Any] = [:]
        var fields: [String: Any] = [:]
        if(iOSParameters != nil) {
            fields += iOSParameters!.buildParams()
        }
        if(androidParameters != nil) {
            fields += androidParameters!.buildParams()
        }
        if(airflexParameters != nil) {
            fields += airflexParameters!.buildParams()
        }
        
        var _fields: [[String:Any]] = []
        fields.forEach({ (key: String, value: Any) in
            _fields.append(["key": key, "value": value])
        })
        
        params["fields"] = _fields
        
        return params
    }
    
    public func createLink(completion: @escaping (DeepLinkBuilderResult?, DeepLinkBuilderError?) -> Void) {
        let params = buildParams()
        HttpClient.shared.post(with: "/partner/deeplink/create", params: params) { _data, _error in
            if let data = _data {
                do {
                    let result = try JSONDecoder().decode(ResultData.self, from: data)
                    if result.responseCode >= 200 && result.responseCode < 299 {
                        let deeplinkResult = try JSONDecoder().decode(DeepLinkResultData.self, from: data)
                        if let deeplink = deeplinkResult.data {
                            completion(DeepLinkBuilderResult(shortLink: deeplink.short_link, longLink: deeplink.long_link), nil)
                        } else {
                            completion(nil, DeepLinkBuilderError(code: "0", message: "data is null"))
                        }
                    } else {
                        completion(nil, DeepLinkBuilderError(code: "\(result.responseCode)", message: "\(result.responseText)"))
                        
                    }
                } catch {
                    completion(nil, DeepLinkBuilderError(code: "0", message: "\(error.localizedDescription)"))
                }
            } else {
                completion(nil, DeepLinkBuilderError(code: "0", message: "\(String(describing: _error?.localizedDescription))"))
            }
        }
    }
}