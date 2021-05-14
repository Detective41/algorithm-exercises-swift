func myPow(_ x: Double, _ n: Int) -> Double {
    return n >= 0 ? myPowHelper(x, n) : 1 / myPowHelper(x, -n)
}

func myPowHelper(_ x :Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    }
    
    let res = myPowHelper(x, n / 2)
    return n % 2 == 0 ? res * res : res * res * x
}