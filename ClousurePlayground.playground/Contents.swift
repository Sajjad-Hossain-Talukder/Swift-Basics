


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


