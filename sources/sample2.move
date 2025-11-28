module bambo_addr::Sample2{

const MY_ADDR: address = @bambo_addr;

fun comfirm_value(choice : bool) : (u64, bool){
    if (choice)
        return (1, choice)
    else 
        return (0, choice)
}

#[test_only]
// use std::debug::print;

// #[test]
fun test_function() {
    let (number, choice)= comfirm_value(true);
    // print(&number);
    // print(&choice);
}
}