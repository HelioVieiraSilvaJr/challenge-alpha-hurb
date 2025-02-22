//
//  SearchResultModelMock.swift
//  Challenge_iOSTests
//
//  Created by Helio Junior on 15/11/22.
//

import Foundation
@testable import Challenge_iOS

let searchResulHotelModelMock = SearchResultModel(
    id: nil,
    name: "Imperial Plaza Hotel",
    description: "Localizado a 15 km da cidade de Brasília e 22 km do Aeroporto Internacional JK",
    smallDescription: "Localizado a 15 km da cidade de Brasília e 22 km do Aeroporto Internacional JK",
    category: .hotel,
    isAvailable: true,
    huFreeCancellation: false,
    gallery: [
        SearchResultModel.Gallery(url: "https://thumbcdn-z.hotelurbano.net/b1UA0AzQ5ztR0YyYvKsldRLCUPc=/origxorig/center/middle/filters:quality(70)/https://novo-hu.s3.amazonaws.com/reservas/ota/prod/hotel/519158/2016072814697157749_20180131144941.jpg"),
        SearchResultModel.Gallery(url: "https://thumbcdn-z.hotelurbano.net/J9mbUib9kfYqpkwj4Rhc5LXVXak=/origxorig/center/middle/filters:quality(70)/https://s3.amazonaws.com/legado-prod/prod/ofertas/imagens/2022/10/24/10/38/109925744.jpg")
    ],
    sku: "HT-VKLT-0-0-0-0-0-0-0-0-0",
    price: SearchResultModel.Price(amount: 157.90000000000001, currency: "BRL"),
    address: SearchResultModel.Address(state: "Distrito Federal",
                                       country: "Brasil",
                                       city: "Brasília",
                                       geoLocation: nil),
    amenities: [
        SearchResultModel.Amenities(name: "Estacionamento", category: nil),
        SearchResultModel.Amenities(name: "Spa", category: nil)
    ],
    quantityDescriptors: nil,
    startDate: nil,
    endDate: nil,
    stars: 4)

let searchResulPackageModelMock = SearchResultModel(
    id: "1413827",
    name: "Pacote de Viagem - CDesign Hotel (Rio de Janeiro) - 2023",
    description: "Aéreo + Hospedagem com Café da Manhã",
    smallDescription: "Aéreo + Hospedagem com Café da Manhã",
    category: .pacote,
    isAvailable: true,
    huFreeCancellation: nil,
    gallery: [
        SearchResultModel.Gallery(url: "https://thumbcdn-z.hotelurbano.net/b1UA0AzQ5ztR0YyYvKsldRLCUPc=/origxorig/center/middle/filters:quality(70)/https://novo-hu.s3.amazonaws.com/reservas/ota/prod/hotel/519158/2016072814697157749_20180131144941.jpg"),
        SearchResultModel.Gallery(url: "https://thumbcdn-z.hotelurbano.net/J9mbUib9kfYqpkwj4Rhc5LXVXak=/origxorig/center/middle/filters:quality(70)/https://s3.amazonaws.com/legado-prod/prod/ofertas/imagens/2022/10/24/10/38/109925744.jpg")
    ],
    sku: "HT-7LSJ-0-0-0-0-0-0-0-0-0",
    price: SearchResultModel.Price(amount: 129900, currency: "BRL"),
    address: SearchResultModel.Address(state: "Rio de Janeiro",
                                       country: "Brasil",
                                       city: "Rio de Janeiro",
                                       geoLocation: SearchResultModel.Geolocation(
                                        lat: -22.913885042711016,
                                        lon: -43.726179230004568)),
    amenities: [
        SearchResultModel.Amenities(name: "Hospedagem", category: nil),
        SearchResultModel.Amenities(name: "Café da manhã", category: nil),
        SearchResultModel.Amenities(name: "Passagem Aérea", category: nil)
    ],
    quantityDescriptors: SearchResultModel.QuantityDescriptors(maxPeople: 2, duration: 1),
    startDate: "2022-10-05T00:00:00",
    endDate: "2023-09-30T23:59:59",
    stars: nil)
