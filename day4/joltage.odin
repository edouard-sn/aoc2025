package main

import "core:fmt"
import "core:math"
import "core:strconv"
import "core:strings"

is_scroll :: proc(c: u8) -> bool {
	return c == '@'
}

detect_scroll :: proc(rows: []string, x, y:int) -> int {
	if x < 0 || y < 0 || y >= len(rows[0]) || x >= len(rows) {
		return 0
	}
	return  is_scroll(rows[y][x]) ? 1 : 0
}

change_rune :: proc(pr: ^byte, val: byte) {
	pr^ = val
}

get_accessible_rolls_count :: proc (rows: []string) -> (res: int, ok: bool) {
	prout := "prout"
	change_rune((^byte)&prout[0], 'c')
	fmt.printf("%s\n",)
// rows_len := len(rows[0])
// 	collumns_len := len(rows)
// 	for y := 0; y < collumns_len; y+=1 {
// 		for x := 0; x < rows_len; x+=1 {
// 			if !is_scroll(rows[y][x]) {
// 				continue
// 			}
// 			total := detect_scroll(rows, x+1, y)
// 			total += detect_scroll(rows, x+1, y+1)
// 			total += detect_scroll(rows, x, y+1)
// 			total += detect_scroll(rows, x-1, y+1)
// 			total += detect_scroll(rows, x+1, y-1)
// 			total += detect_scroll(rows, x-1, y)
// 			total += detect_scroll(rows, x-1, y-1)
// 			total += detect_scroll(rows, x, y-1)
// 			if total < 4 {
// 				fmt.printf("%d:%d\n", x, y)
// 				res += 1
// 			}
// 		}
// 	}
	return res, true
}

get_total_accessible_rolls_count :: proc (rows: []string) -> (res: int, ok: bool) {
	// prows := rows
	
	// rows_len := len(rows[0])
	// collumns_len := len(rows)
	// for x := 0; x < rows_len; x+=1 {
	// 	for y := 0; y < collumns_len; y+=1 {
	// 		if !is_scroll(rows_clone[y][x]) {
	// 			continue
	// 		}
	// 		total := detect_scroll(rows_clone, x+1, y)
	// 		total += detect_scroll(rows_clone, x+1, y+1)
	// 		total += detect_scroll(rows_clone, x, y+1)
	// 		total += detect_scroll(rows_clone, x-1, y+1)
	// 		total += detect_scroll(rows_clone, x+1, y-1)
	// 		total += detect_scroll(rows_clone, x-1, y)
	// 		total += detect_scroll(rows_clone, x-1, y-1)
	// 		total += detect_scroll(rows_clone, x, y-1)
	// 		if total < 4 {
	// 			rows_clone
	// 			fmt.printf("%d:%d\n", x, y)
	// 			res += 1
	// 		}
	// 	}
	// }
	return res, true
}