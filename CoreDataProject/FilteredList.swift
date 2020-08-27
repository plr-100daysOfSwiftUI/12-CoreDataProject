//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Paul Richardson on 26.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
	
	var fetchRequest: FetchRequest<T>
	var singers: FetchedResults<T> { fetchRequest.wrappedValue }
	
	let content: (T) -> Content
	
	var body: some View {
		List(singers, id: \.self) { singer in
			self.content(singer)
		}
	}
	
	init(sortDescriptors: [NSSortDescriptor], filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
		fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
		self.content = content
	}
}
