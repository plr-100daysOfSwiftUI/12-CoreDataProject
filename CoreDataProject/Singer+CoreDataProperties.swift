//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Paul Richardson on 26.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
		return NSFetchRequest<Singer>(entityName: "Singer")
	}
	
	@NSManaged public var lastName: String?
	@NSManaged public var firstName: String?
	
	var wrappedFirstName: String {
		firstName ?? "Unknown"
	}
	
	var wrappedLastName: String {
		lastName ?? "Unknown"
	}
	
	
}
