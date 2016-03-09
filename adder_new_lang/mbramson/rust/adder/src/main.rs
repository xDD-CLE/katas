fn main() {

}

fn add(numbers: &str) -> i32 {
    match numbers {
        "5" => return 5,
        _ => return 0
    }
}

#[test]
fn add_function_exists() {
    add("abc");
}

#[test]
fn add_returns_0_if_empty_string() {
    assert_eq!(0, add(""));
}

#[test]
fn add_returns_5_when_passed_5() {
    assert_eq!(5, add("5"));
}
