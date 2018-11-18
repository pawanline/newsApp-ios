//
//  Article.swift
//
//  Created by Pawan Kumar on 19/11/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Article: Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.

    private struct SerializationKeys {
        static let content = "content"
        static let publishedAt = "publishedAt"
        static let descriptionValue = "description"
        static let title = "title"
        static let urlToImage = "urlToImage"
        static let author = "author"
        static let url = "url"
    }

    // MARK: Properties

    public var content: String?
    public var publishedAt: String?
    public var descriptionValue: String?
    public var title: String?
    public var urlToImage: String?
    public var author: String?
    public var url: String?

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
        content <- map[SerializationKeys.content]
        publishedAt <- map[SerializationKeys.publishedAt]
        descriptionValue <- map[SerializationKeys.descriptionValue]
        title <- map[SerializationKeys.title]
        urlToImage <- map[SerializationKeys.urlToImage]
        author <- map[SerializationKeys.author]
        url <- map[SerializationKeys.url]
    }

    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = content { dictionary[SerializationKeys.content] = value }
        if let value = publishedAt { dictionary[SerializationKeys.publishedAt] = value }
        if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
        if let value = title { dictionary[SerializationKeys.title] = value }
        if let value = urlToImage { dictionary[SerializationKeys.urlToImage] = value }
        if let value = author { dictionary[SerializationKeys.author] = value }
        if let value = url { dictionary[SerializationKeys.url] = value }
        return dictionary
    }

    // MARK: NSCoding Protocol

    public required init(coder aDecoder: NSCoder) {
        content = aDecoder.decodeObject(forKey: SerializationKeys.content) as? String
        publishedAt = aDecoder.decodeObject(forKey: SerializationKeys.publishedAt) as? String
        descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
        urlToImage = aDecoder.decodeObject(forKey: SerializationKeys.urlToImage) as? String
        author = aDecoder.decodeObject(forKey: SerializationKeys.author) as? String
        url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(content, forKey: SerializationKeys.content)
        aCoder.encode(publishedAt, forKey: SerializationKeys.publishedAt)
        aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
        aCoder.encode(title, forKey: SerializationKeys.title)
        aCoder.encode(urlToImage, forKey: SerializationKeys.urlToImage)
        aCoder.encode(author, forKey: SerializationKeys.author)
        aCoder.encode(url, forKey: SerializationKeys.url)
    }
}
