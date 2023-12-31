//
//  BasketItemView.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 6.08.2023.
//

import SwiftUI
import RealmSwift

struct BasketItemView: View {
    @Environment(\.screenFrame) var screenFrame
    @ObservedRealmObject var furnitureGroup: FurnituresGroup
    var body: some View {
        ForEach(furnitureGroup.furnitures, id: \.self) { (furn: Furnitures) in
            if furn.isBuyed {
                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .top, spacing: 16) {
                        // MARK: Furniture Image View
                        FurnImage(imageName: furn.imageName)
                        VStack(alignment: .leading, spacing: 19) {
                            HStack(alignment: .top, spacing: 8) {
                                VStack(alignment: .leading, spacing: 4) {
                                    // MARK: Furniture Price View
                                    FurnPrice(priceQuantitiy: furn.price, fontSize: 16)
                                    // MARK: Furniture Name View
                                    FurnName(furnName: furn.name)
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                // MARK: Furniture Delete From Basket Button View
                                Button {
                                    RealmManager.shared.deleteFromBasket(furn)
                                } label: {
                                    TrashImage()
                                }
                            }
                            .padding(0)
                            // MARK: Stepper View
                            HStack(alignment: .top, spacing: 10) {
                                HStack(spacing: 16.5) {
                                    ButtonsComponent.stepperButtonElements(imageName: Image.minus) {
                                        RealmManager.shared.decrementBuyedQuantity(furn, lowerBound: 0)
                                    }
                                    FurnBuyedQuantity(furnBuyedQuantity: furn.buyedQuantity)
                                    ButtonsComponent.stepperButtonElements(imageName: Image.plus) {
                                        RealmManager.shared.incrementBuyedQuantity(furn, upperBound: 5)
                                    }
                                }
                            }
                            .padding(.horizontal, 8)
                            .padding(.top, 8)
                            .padding(.bottom, 7)
                            .frame(width: screenFrame.width * 0.25,
                                   height: screenFrame.height * 0.04,
                                   alignment: .top)
                            .background(Color.ECBackground)
                            .cornerRadius(8)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: screenFrame.width * 0.9, alignment: .topLeading)
                }
                .padding(16)
            }
        }
    }
}
