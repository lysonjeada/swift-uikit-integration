//
//  ScheduleView.swift
//  property-app
//
//  Created by Amaryllis Rosemaria Baldrez Calefi on 14/08/24.
//

import SwiftUI

struct ScheduleView: View {
    var properties: [Property] = []
    
    init() {
        self.properties = getMockProperties()
    }
    
    var body: some View {
        NavigationView {
            List(properties) { property in
                PropertyRowView(property: property)
            }
            .navigationTitle("Scheduled Properties")
        }
    }
    
    func getMockProperties() -> [Property] {
        return [
            Property(id: UUID(), type: "Apartment", price: "$100,000", address: "123 Flower Street"),
            Property(id: UUID(), type: "House", price: "$150,000", address: "45 Brazil Avenue"),
            Property(id: UUID(), type: "Apartment", price: "$60,000", address: "456 Green Street"),
            Property(id: UUID(), type: "House", price: "$190,000", address: "789 Sun Street"),
            Property(id: UUID(), type: "Apartment", price: "$90,000", address: "12 Central Avenue"),
            Property(id: UUID(), type: "House", price: "$240,000", address: "99 Sea Street"),
            Property(id: UUID(), type: "Apartment", price: "$120,000", address: "33 Blue Street"),
            Property(id: UUID(), type: "House", price: "$160,000", address: "100 Paulista Avenue"),
            Property(id: UUID(), type: "Apartment", price: "$110,000", address: "44 Yellow Street"),
            Property(id: UUID(), type: "House", price: "$200,000", address: "200 Palm Avenue")
        ]
    }
}

#Preview {
    ScheduleView()
}

struct PropertyRowView: View {
    let property: Property
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(property.type)
                .font(.headline)
                .foregroundColor(.blue)
            Text(property.price)
                .font(.subheadline)
                .foregroundColor(.green)
            Text(property.address)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
