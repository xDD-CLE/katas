fn main() {

}

fn add(numbers: &str) -> i32 {

    let numbers: Vec<&str> = numbers.split(',').collect();

    let mut sum: i32 = 0;

    for number in numbers {
        match number.parse::<i32>() {
            Ok(n) => sum += n,
            _ => continue
        }
    }
    return sum;
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

#[test]
fn add_returns_9_when_passed_9() {
    assert_eq!(9, add("9"));
}

#[test]
fn add_returns_sum_of_1_and_2() {
    assert_eq!(3, add("1,2"));
}
