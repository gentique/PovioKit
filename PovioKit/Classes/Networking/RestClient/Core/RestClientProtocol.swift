//
//  RestClientProtocol.swift
//  PovioKit
//
//  Created by Borut Tomažin on 14/01/2019.
//  Copyright © 2019 Povio Labs. All rights reserved.
//

import Foundation

public protocol NetworkErrorProtocol: Swift.Error {
  init(invalidUrl url: String)
  init(_ error: Swift.Error)
  
  static var decoding: Self { get }
  static var encoding: Self { get }
}

public protocol RestClientProtocol {
  associatedtype NetworkError: NetworkErrorProtocol
  
  typealias Headers = [String: String]
  typealias Params = [String: Any]
  typealias DataResult = ((Swift.Result<DataResponse, NetworkError>) -> Void)?
  typealias GenericResult<T: Decodable> = ((Swift.Result<T, NetworkError>) -> Void)?
  
  func GET(endpoint: EndpointProtocol, parameters: Params?, headers: Headers?, _ result: DataResult)
  func GET<T: Decodable>(decode: T.Type, endpoint: EndpointProtocol, parameters: Params?, headers: Headers?, _ result: GenericResult<T>)
  func POST(endpoint: EndpointProtocol, parameters: Params?, headers: Headers?, _ result: DataResult)
  func POST<T: Decodable>(decode: T.Type, endpoint: EndpointProtocol, parameters: Params?, headers: Headers?, _ result: GenericResult<T>)
  func PUT(endpoint: EndpointProtocol, parameters: Params?, headers: Headers?, _ result: DataResult)
  func PUT<T: Decodable>(decode: T.Type, endpoint: EndpointProtocol, parameters: Params?, headers: Headers?, _ result: GenericResult<T>)
  func DELETE(endpoint: EndpointProtocol, parameters: Params?, headers: Headers?, _ result: DataResult)
  func DELETE<T: Decodable>(decode: T.Type, endpoint: EndpointProtocol, parameters: Params?, headers: Headers?, _ result: GenericResult<T>)
}
