address bambo_addr{

    module PriceOracle {
        public fun btc_price(): u128{
            return 54300
        }
    }



    module CastingDemo {
        use bambo_addr::PriceOracle;
        use std::debug::print;

        fun calculate_swap(){
            let price =PriceOracle::btc_price();
            let price_w_fee: u64 = (price as u64) +  5;
            let price_u128 = (price_w_fee as u128);
            print(&price_u128)
        }

        #[test]
        fun test_function(){
            calculate_swap();
        }
    }





}