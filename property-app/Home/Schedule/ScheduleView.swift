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
                    .listRowBackground(Color.clear)
            }
            .navigationTitle("Imóveis agendados")
        }
    }
    
    func getMockProperties() -> [Property] {
        return [
            Property(id: UUID(), type: "Apartamento", price: "R$1.000,00", address: "Rua das Flores, 123"),
            Property(id: UUID(), type: "Casa", price: "R$1.500,00", address: "Avenida Brasil,45"),
            Property(id: UUID(), type: "Apartamento", price: "R$1.600,00", address: "Rua Verde, 456"),
            Property(id: UUID(), type: "Casa", price: "R$1.800,00", address: "Rua do Sol, 789"),
            Property(id: UUID(), type: "Apartamento", price: "R$1.500,00", address: "Avenida Central, 12"),
            Property(id: UUID(), type: "Casa", price: "R$1.500,00", address: "Rua do Mar, 99"),
            Property(id: UUID(), type: "Apartamento", price: "R$1.500,00", address: "Rua Azul, 33"),
            Property(id: UUID(), type: "Casa", price: "R$1.500,00", address: "Avenida Paulista, 100"),
            Property(id: UUID(), type: "Apartamento", price: "R$1.500,00", address: "Rua Amarela, 44"),
            Property(id: UUID(), type: "Casa", price: "R$1.500,00", address: "Avenida das Palmeiras, 200")
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
                .foregroundColor(Color(hex: "761137"))
            Text(property.price)
                .font(.subheadline)
                .foregroundColor(Color(hex: "ed335f"))
            Text(property.address)
                .font(.footnote)
                .foregroundColor(Color(hex: "f9858b"))
                .lineLimit(nil)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
