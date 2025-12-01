module bambo_addr::Sample8{
    // use std::string::{String, utf8};
    const E_NOTENOUGH : u64 = 0;
    const BB: u64 = 1;
    const APT: u64 = 2;
    const ETH: u64 = 3;

    const POOL1_BB: u64 = 312;
    const POOL1_USDT : u64 = 3201;
    const BB_NAME : vector<u8> = b"bb Rewards";
    
    const POOL2_APT: u64 = 21500;
    const POOL2_USDT : u64 = 124700;
    const APT_NAME : vector<u8> = b"APT";
        
    const POOL3_WETH: u64 = 1310;
    const POOL3_USDT : u64 = 2750000;
    const WETH_NAME : vector<u8> = b"WETH";

    fun get_supply(coin_symbol : u64):(u64, u64, vector<u8>){
        if(coin_symbol == BB)
            return (POOL1_BB, POOL1_USDT, BB_NAME)
        else if(coin_symbol == APT)
            return (POOL2_APT, POOL2_USDT, APT_NAME)
        else 
            return (POOL3_WETH, POOL3_USDT, WETH_NAME)
    }
        
    // Constant product AMM formula: x * y = k
    // Fee: 0.5% = 5/1000
    fun calculate_swap(coin1: u64, coin2: u64, coin1_amt: u64): u64 {
        assert!(coin1_amt > 0, E_NOTENOUGH);
        
        // Apply 0.5% fee (5/1000)
        let fee = (coin1_amt * 5) / 1000;
        let coin1_amt_after_fee = coin1_amt - fee;
        
        // Constant product formula: k = coin1 * coin2
        let k = coin1 * coin2;
        
        // New coin1 amount after swap
        let new_coin1 = coin1 + coin1_amt_after_fee;
        
        // Calculate new coin2 amount to maintain k
        let new_coin2 = k / new_coin1;
        
        // Amount received is the difference
        let receive = coin2 - new_coin2;
        
        receive
    }
    
    fun token_price(coin2 : u64, coin1: u64): u64 {
        assert!(coin1 > 0, E_NOTENOUGH);
        assert!(coin2 > 0, E_NOTENOUGH);
        return coin2/coin1
    }

    #[test_only]
    use std::debug::print;

    #[test_only]
    use std::string::{utf8};

    #[test]
    fun test_function(){
        let (coin1, coin2, name) = get_supply(BB);
        let swap_amount = 512;
        print(&utf8(b"Swap WETH for:"));
        print(&utf8(name));

        print(&utf8(b"Initial Price:"));
        let price_before = token_price(coin2, coin1);
        print(&price_before);

        print(&utf8(b"USDT received:"));
        let result = calculate_swap(coin1, coin2, swap_amount);
        print(&result);

        print(&utf8(b"Price After Swap:"));
        // Calculate the amount after fee (0.5% fee)
        let fee = (swap_amount * 5) / 1000;
        let swap_amount_after_fee = swap_amount - fee;
        
        let coin1_after = coin1 + swap_amount_after_fee;
        let coin2_after = coin2 - result;
        let price_after = token_price(coin2_after, coin1_after);
        print(&price_after);
    }
}