package main

import "core:fmt"
import "core:math"
import "core:strconv"
import "core:strings"

get_password :: proc(ranges: []string) -> (int, bool) {
	res := 0
	for range in ranges {
		range_list, merr := strings.split(range, "-")
		if merr != nil {
			fmt.printf("memory error: %v", merr)
			return 0, false
		}
		r_min, okmin := strconv.parse_int(range_list[0], 10)
		if !okmin {
			return 0, false
		}
		r_max, okmax := strconv.parse_int(range_list[1], 10)
		if !okmax {
			return 0, false
		}
		for i := r_min; i <= r_max; i += 1 {
			f_n_digit := math.floor(math.log10(f64(i))) + 1
			n_digit := int(f_n_digit)
			if n_digit % 2 != 0 {
				continue
			}
			factor := int(math.pow10(f_n_digit / 2))
			if i % factor == i / factor {
				res += i
			}
		}

	}
	return res, true
}

clerk_pass :: proc(n: int, n_digit: int) -> bool {
	if n_digit == 1 {
		return false
	}
	outer: for i := 2; i <= n_digit; i += 1 {
		if n_digit % i != 0 {
			continue
		}
		if math.pow10(f64(n_digit)) == f64(n) {
			continue
		}
		factor := int(math.pow10(f64(n_digit / i)))
		ref := n % factor
		n_clone := n / factor
		for j := 0; j < i - 1; j += 1 {
			if n_clone % factor != ref {
				continue outer
			}
			n_clone /= factor
		}
		return true
	}
	return false
}

get_password_clerk_pass :: proc(ranges: []string) -> (int, bool) {
	res := 0
	for range in ranges {
		range_list, merr := strings.split(range, "-")
		if merr != nil {
			fmt.printf("memory error: %v", merr)
			return 0, false
		}
		r_min, okmin := strconv.parse_int(range_list[0], 10)
		if !okmin {
			return 0, false
		}
		r_max, okmax := strconv.parse_int(range_list[1], 10)
		if !okmax {
			return 0, false
		}
		for i := r_min; i <= r_max; i += 1 {
			f_n_digit := math.floor(math.log10(f64(i))) + 1
			n_digit := int(f_n_digit)
			if clerk_pass(i, n_digit) {
				res += i
			}
		}
	}
	return res, true
}
