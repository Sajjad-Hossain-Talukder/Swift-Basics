

// constant struct should be names with K
struct K {
    let instanceProperty = 5
    
    func instanceMethod () {
        print ( "This is a instance Method. To invoke instance method & property, An Object must be created.")
        print("instanceMethod is the behaviour and instanceProperty is the property of Object ")
    }
    
    
    static let typeProperty  = 56
    static func typeMethod() {
        print("typeProperty and typeMethod both are related to Struct/Class type. To invoke those, it doesn't need to create any object. It could be invoked using Struct or Class name.")
    }
    
}

let obj = K()


// Instance Access
obj.instanceMethod()
print(obj.instanceProperty)



// Type Access

K.typeMethod()
print(K.typeProperty)






