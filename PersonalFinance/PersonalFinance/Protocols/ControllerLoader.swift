//
//  ControllerLoader.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//
// ------
// The concrete instance of this class will have the capability of providing necessary dependencies to the controller before loading it.

// Dependency provider

@objc protocol ControllerLoader {
    func loadController()
}