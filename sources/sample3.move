// address bambo_addr {

//     module one {
//         friend bambo_addr::two;
//         friend bambo_addr::three;

//         // Only friends can call this
//         public(friend) fun get_value(): u64 {
//             return 100;
//         }

//         #[view]
//         public fun get_prices(): u64 {
//             // return something
//             return 200;
//         }
//     }

//     module two {
//         use std::debug;

//         #[test]
//         fun test_function() {
//             let result = bambo_addr::one::get_value();
//             debug::print(&result);
//         }
//     }

//     module three {
//         use std::debug;

//         #[test]
//         fun test_function() {
//             let result = bambo_addr::one::get_value();
//             debug::print(&result);
//         }
//     }
// }
