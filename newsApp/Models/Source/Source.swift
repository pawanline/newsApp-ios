//
//  Source.swift
//  newsApp
//
//  Created by Pawan Kumar on 18/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Source: Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    
    private struct SerializationKeys {
        static let name = "name"
        static let id = "id"
        static let language = "language"
        static let descriptionValue = "description"
        static let category = "category"
        static let url = "url"
        static let country = "country"
    }
    
    // MARK: Properties
    
    public var name: String?
    public var id: String?
    public var language: String?
    public var descriptionValue: String?
    public var category: String?
    public var url: String?
    public var country: String?
    
    // MARK: ObjectMapper Initializers
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map) {
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
        name <- map[SerializationKeys.name]
        id <- map[SerializationKeys.id]
        language <- map[SerializationKeys.language]
        descriptionValue <- map[SerializationKeys.descriptionValue]
        category <- map[SerializationKeys.category]
        url <- map[SerializationKeys.url]
        country <- map[SerializationKeys.country]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = language { dictionary[SerializationKeys.language] = value }
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = category { dictionary[SerializationKeys.category] = value }
        if let value = url { dictionary[SerializationKeys.url] = value }
        if let value = country { dictionary[SerializationKeys.country] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    
    public required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        language = aDecoder.decodeObject(forKey: SerializationKeys.language) as? String
        descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        category = aDecoder.decodeObject(forKey: SerializationKeys.category) as? String
        url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
        country = aDecoder.decodeObject(forKey: SerializationKeys.country) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: SerializationKeys.name)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(language, forKey: SerializationKeys.language)
        aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
        aCoder.encode(category, forKey: SerializationKeys.category)
        aCoder.encode(url, forKey: SerializationKeys.url)
        aCoder.encode(country, forKey: SerializationKeys.country)
    }
}
