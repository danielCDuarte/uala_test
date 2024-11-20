//
//  ErrorHandlerProtocol.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

protocol ErrorHandlerProtocol: AnyObject {
    func showError(error: Error)
}

protocol ErrorProcessorProtocol {
    var errorHandler: ErrorHandlerProtocol? { get set }
}
