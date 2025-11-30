module bambo_addr::Sample5 {

    const ADD: u64 = 1;
    const SUB: u64 = 2;
    const MUL: u64 = 3;
    const DIV: u64 = 4;
    const MOD: u64 = 5;

    fun arthmetic_operations(a: u64, b: u64, operator: u64): u64 {
        if (operator == ADD)
            return a + b
        else if (operator == SUB)
            return a - b
        else if (operator == MUL)
            return a * b
        else if (operator == DIV)
            return a / b
        else
            return a % b
    }

    #[test_only]
    use std::debug::print;

    #[test]
    fun test_arthmetic() {
        let result = arthmetic_operations(14, 5, MOD);
        print(&result); // should now print 5
    }


    const HIGHER: u64 = 1;
    const LOWER: u64 = 2;
    const HIGER_EQ: u64 = 3;
    const LOWER_EQ: u64 = 4;


    fun equality_operations(a: u64, b: u64, operator: u64): bool {
        if (operator == HIGHER)
            return a > b
        else if (operator == LOWER)
            return a < b
        else if (operator == HIGER_EQ)
            return a >= b
        else
            return a <= b
    }

    
    #[test]
    fun test_equality() {
        let result = equality_operations(14, 19, HIGER_EQ);
        print(&result);
    }


}
