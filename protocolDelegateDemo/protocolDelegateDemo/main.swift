//
//  main.swift
//  protocolDelegateDemo
//
//  Created by Xotech on 12/12/2023.
//

protocol AdvanceLifeSupport {
    func performCPR()
}



class EmergencyCallHandler {
    var delegate : AdvanceLifeSupport?
    
    func assessSituation() {
        print("Tell me what happened ? ")
    }
    
    func emergencyTreatment(){
        delegate!.performCPR()
    }
}

struct Paramedic : AdvanceLifeSupport {
    let name : String
    init(handler:EmergencyCallHandler, nm : String ){
        name = nm
        handler.delegate = self
    }
    
    func performCPR() {
        print("Paramedic \(name) Is here to help you. Keep Patience")
    }
    
    func paraTask() {
        print("Paramedic are responsible for ..... ")
    }
    
}

let emergencyWorkerSajjad = EmergencyCallHandler()
let paramedicWorkerArman = Paramedic(handler: emergencyWorkerSajjad , nm: "Arman")
let paramedicWorkerSakib = Paramedic(handler: emergencyWorkerSajjad , nm: "Sakib")


emergencyWorkerSajjad.assessSituation()
emergencyWorkerSajjad.emergencyTreatment()
