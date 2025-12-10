package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
	args := os.args
	if len(args) < 3 {
		fmt.printf("usage: %s (ex1|ex2) grid-file", args[0])
		return
	}
	data, err := os.read_entire_file_from_filename_or_err(args[2])
	if err != nil {
		fmt.printf("could not read file: %v", err)
		return
	}

	grid := string(data)
	grid = strings.trim(grid, " \n")
	rows, merr := strings.split(grid, "\n")
	if merr != nil {
		fmt.printf("memory error: %v", merr)
		return
	}

	rolls, ok := 0, false
	switch args[1] {
	case "ex1":
		rolls, ok = get_accessible_rolls_count(rows)
	case "ex2":
		fallthrough
	}

	if ok {
		fmt.printf("accessible rolls: %d\n", rolls)
	} else {
		fmt.printf("invalid moves")
	}
	return
}
