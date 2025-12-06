package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
	args := os.args
	if len(args) < 3 {
		fmt.printf("usage: %s (ex1|ex2) password-file", args[0])
		return
	}
	data, err := os.read_entire_file_from_filename_or_err(args[2])
	if err != nil {
		fmt.printf("could not read file: %v", err)
		return
	}
	ranges := string(data)
	ranges = strings.trim(ranges, " \n")
	range_list, merr := strings.split(ranges, ",")
	if merr != nil {
		fmt.printf("memory error: %v", merr)
		return
	}

	password, ok := 0, false
	switch args[1] {
	case "ex1":
		password, ok = get_password(range_list)
	case "ex2":
		password, ok = get_password_clerk_pass(range_list)
	}

	if ok {
		fmt.printf("invalid ids sum: %d\n", password)
	} else {
		fmt.printf("invalid moves")
	}
	return
}
