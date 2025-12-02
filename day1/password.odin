package main

import "core:strconv"
import "core:strings"

START :: 50

get_password :: proc(moves: []string) -> (int, bool) {
    current := START
    result := 0
    for &move in moves {
        move = strings.trim(move, " \n")
        factor := 1
        dir := move[0]
        if dir == 'L' {
            factor = -1
        } else if dir != 'R' {
            return 0, false
        }
        dist, ok := strconv.parse_int(move[1:], 10)
        if !ok {
            return 0, false
        }
        total_dist := factor * dist
        current += total_dist
        if current < 0 {
            current = 100-(-current%100)
        }
        if current > 99 {
            current %= 100
        }
        if current == 0 {
            result += 1
        }
    }
    return result, true
}

get_password_new_method :: proc(moves: []string) -> (int, bool) {
    current := START
    result := 0
    for &move in moves {
        factor := 1
        move = strings.trim(move, " \r\n")
        
        if move[0] == 'L' {
            factor = -1
        } else if move[0] != 'R' {
            return 0, false
        }
        dist, ok := strconv.parse_int(move[1:], 10)
        if !ok {
            return 0, false
        }
        
        on_zero: bool = (current == 0)
        total_dist := factor * dist
        current += total_dist
        if current < 0 {
            result += (-current)/100 + int(!on_zero)
            current = -current%100 == 0 ? 0 : (100 - (-current%100))
        } else if current > 99 {
            result += (current) / 100
            current %= 100
        } else if current == 0 {
            result += 1
        }
    }
    return result, true
}