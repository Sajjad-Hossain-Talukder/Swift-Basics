



// Function Inside another function as parameter

/*
func calculator ( n1 : Int , n2 : Int , operation : (Int,Int)->Int )->Int {
    return operation(n1,n2);
}


func multiply ( n1:Int, n2:Int ) -> Int {
    return n1*n2 ;
}

func add ( n1:Int, n2:Int ) -> Int {
    return n1+n2 ;
}

func subtract ( n1:Int, n2:Int ) -> Int {
    return n1-n2 ;
}


calculator(n1 : 1, n2:34 ,operation: multiply )
calculator(n1:100,n2:23, operation: add )
calculator(n1:10,n2:2,operation: subtract  )

*/

// Clousure Starts Here
// Syntex : { (parameterName: Type ) -> returnType in  return .... }


func calculator ( n1 : Int , n2 : Int , operation : (Int,Int)->Int )->Int {
    return operation(n1,n2);
}


calculator(n1: 4, n2: 5, operation:   {  (no1:Int,no2:Int) -> Int  in  return no1*no2  } )


calculator(n1: 40, n2: 5, operation:   {  (no1,no2) in  return no1*no2  } )

calculator(n1: 40, n2: 50, operation:   {  (no1,no2) in  no1*no2  } )

// first parameter $0 and second parameter $1
calculator(n1: 400, n2: 50, operation:   {  $0 * $1  } )


// trailing clousure - if the last parameter is a clousure then, we mau come up with a TC
calculator(n1: 400, n2: 50) {  $0 * $1  }





var oldArray = [1,2,3,4,5,6,7,8]

func addOne(n1:Int)->Int {
    return n1+1
}
var newArray = oldArray.map(addOne)
print(newArray)



// using clousure

var newArrayD = oldArray.map( { (n1:Int)->Int in
    var xI = n1 + 5
    return xI+1
})
print(newArrayD)

var newArray1 = oldArray.map({ n1 in n1+1 })
print ( newArray1 )


var newArray2 = oldArray.map({$0+1})
print ( newArray2 )


var newArray3 = oldArray.map{$0+1}
print ( newArray3 )


