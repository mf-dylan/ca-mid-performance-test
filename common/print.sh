#!/bin/bash

RESET='\033[0m'

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[33;35m'
CYAN='\033[33;36m'

print() {
    echo -e "$1"
}

print_red() {
  echo -e "${RED}$1${RESET}"
}

print_green() {
  echo -e "${GREEN}$1${RESET}"
}

print_yellow() {
  echo -e "${YELLOW}$1${RESET}"
}

print_blue() {
  echo -e "${BLUE}$1${RESET}"
}

print_magenta() {
  echo -e "${MAGENTA}$1${RESET}"
}

print_cyan() {
  echo -e "${CYAN}$1${RESET}"
}

print_separator() {
    echo -e "----------------------------------------"
}