package main

import "core:fmt"
import "core:math"
import "core:strconv"
import "core:strings"

get_max_n_joltage_sum :: proc(batteries: []string, $N: int) -> (result: int, ok: bool) {
	for banks in batteries {
		max_list := [N]rune{}
		list_i := 0
		bank_i := 0
		for i := 0; i < N; i += 1 {
			pmax := &max_list[list_i]
			next_bank_i := 0
			for value in banks[bank_i:len(banks) - (N - i - 1)] {
				if pmax^ < value {
					pmax^ = value
					next_bank_i = bank_i + 1
				}
				bank_i += 1
			}
			bank_i = next_bank_i
			list_i += 1
		}

		final_number := 0
		for i := 0; i < N; i += 1 {
			factor := math.pow10(f64(i))
			curr := strconv.digit_to_int(max_list[N - i - 1]) or_return
			final_number += curr * int(factor)
		}
		result += final_number
	}
	return result, true
}
