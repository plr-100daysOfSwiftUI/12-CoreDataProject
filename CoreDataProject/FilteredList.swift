//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Paul Richardson on 26.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI
import CoreData

enum PredicateFormat: String {
	case beginsWith = "%K BEGINSWITH %@"
	case contains = "%K CONTAINS[c] %@"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
	
	var fetchRequest: FetchRequest<T>
	var results: FetchedResults<T> { fetchRequest.wrappedValue }
	
	let content: (T) -> Content
	
	var body: some View {
		List(results, id: \.self) { result in
			self.content(result)
		}
	}
	
	init(sortDescriptors: [NSSortDescriptor], format: PredicateFormat, filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
		fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: format.rawValue, filterKey, filterValue))
		self.content = content
	}
}
