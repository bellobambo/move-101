module bambo_addr::Sample4{

    fun sample_for_loop(count : u64): u64{
        let value = 0;
        for (i in 0..count){
            value = value + 1;
        };
        value
    }

    fun sample_while_loop(count: u64):u64{
        let value = 0;
        let i : u64 = 1;
        while (i <= count){
            value = value + 1;
            i = i + 1;
        };
        value
    }

    fun sample_loop(count: u64) : u64{
        let value = 0;
        let i: u64 = 1;

        loop{
            value = value + 1;
            i = i + 1;

            if(i > count)
                break;

        };
        value
    }

    #[test_only]
    use std::debug::print;


    #[test]
    fun test_for_loop(){
       let result = sample_for_loop(10);
       print(&result);
    }



    #[test]
    fun test_while_loop(){
       let result = sample_while_loop(10);
       print(&result);
    }


    #[test]
    fun test_loop(){
       let result = sample_loop(100);
       print(&result);
    }




}