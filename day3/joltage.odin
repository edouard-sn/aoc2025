package main

import "core:fmt"
import "core:math"
import "core:strconv"
import "core:strings"

get_max_joltage_sum :: proc(batteries: []string) -> (result: int, ok: bool) {
	for banks in batteries {
		max := 0
		max_tenth := 0
		cache := map[rune]bool{}
		i := 0
		for value in banks {
			i += 1
			if cache[value] {
				continue
			}
			cache[value] = true
			t := strconv.digit_to_int(value) or_return
			if t > max_tenth {
				max_tenth = t
			} else {
				continue
			}
			for v in banks[i:] {
				d := strconv.digit_to_int(v) or_return
				if (t * 10 + d) > max {
					max = t * 10 + d
				}
			}
		}
		result += max
	}
	return result, true
}
