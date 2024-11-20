//
//  BaseViewModelProtocol.swift
//  uala_test
//
//  Created by Daniel Crespo Duarte on 18/11/24.
//

import Foundation

protocol BaseViewModelProtocol {
    
    var view: BaseView? {get set}
    
    func bind(withView view: BaseView)
    func unBind()
    func viewAppear()
    func viewDidAppear()
    func getInitialState()
}
