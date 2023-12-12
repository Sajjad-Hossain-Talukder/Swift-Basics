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
        print("Paramedic \(name) is here to help you. Keep Patience")
    }
    
    func paraTask() {
        print("Paramedic are responsible for ..... ")
    }
}


class Doctor: AdvanceLifeSupport {
    init(handler:EmergencyCallHandler){
        handler.delegate = self
    }
    func performCPR() {
        print("Doctor is here. Don't Worry!!!")
    }
    func suggestMedicine() {
        print("These are the suggested medicine. Have timely... ")
    }
}

class Sergon : Doctor {
    override func performCPR() {
        super.performCPR()
        print("I am Surgon.")
    }
    func surgeryNeeded(){
        print("This patient must be come under surgery immediately")
    }
}

let emergencyWorkerSajjad = EmergencyCallHandler()
let paramedicWorkerArman = Paramedic(handler: emergencyWorkerSajjad , nm: "Arman")
let paramedicWorkerSakib = Paramedic(handler: emergencyWorkerSajjad , nm: "Sakib")

let surgonWorkerNain = Sergon(handler: emergencyWorkerSajjad)


emergencyWorkerSajjad.assessSituation()
emergencyWorkerSajjad.emergencyTreatment()
