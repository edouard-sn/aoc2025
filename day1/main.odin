package main

import "core:os"
import "core:fmt"
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
    moves := string(data)
    moves = strings.trim(moves, " \n")
    move_list, merr := strings.split(moves, "\n")
    if merr != nil {
        fmt.printf("memory error: %v", merr)
    }

    password, ok2 := 0, false
    switch args[1] {
    case "ex1":
        password, ok2 = get_password(move_list)
    case "ex2": 
        password, ok2 = get_password_new_method(move_list)
    }

    if ok2 {
        fmt.printf("password: %d\n", password)
    } else {
        fmt.printf("invalid moves")
    }
    return
}