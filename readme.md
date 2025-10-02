# Lab 1 — Buffer Overflow Report

## Overview
This lab demonstrates stack-based buffer overflow vulnerabilities on a 32-bit Linux system. The objectives were to exploit a vulnerable program, obtain elevated privileges, and bypass ASLR protection. The exercises were performed on a controlled laboratory VM for educational purposes.

---

## Prerequisites
- 32-bit Linux VM (lab environment)
- gcc (with ability to set Exec stack)
- Python 3

---

## Repository / Files
- `stack.c` — vulnerable program used in the lab
- `exploit2.py` — Python exploit used to generate `badfile`
- `brute_force.sh` — brute-force script used to defeat ASLR
- Image references (images are stored in the `images/` folder): `Task 1.1.png`, `Task 1.2.png`, `Task 1.3.png`, `Task 2.1.png`, `Task 2.2.png`, `Task 2.3.png`, `Task 3.1.png`, `Task 3.2.png`

---

## Task 1 — Basic Buffer Overflow
**Objective:** Exploit a vulnerable program to execute arbitrary code.

**Exploit approach:**
- Determined the correct return address offset via debugging.
- Placed shellcode at an appropriate position in the payload.
- Configured a NOP sled to improve reliability.

**Example terminal output:**
```bash
[10/01/25]seed@VM:~/Desktop$ python3 exploit2.py
Generated 'badfile' of length 504 bytes.
Return Address (RET) set to: 0xbffffd00 (Little Endian)
Shellcode placed starting at index: 100
[10/01/25]seed@VM:~/Desktop$ gcc -o stack -z execstack -fno-stack-protector stack.c
[10/01/25]seed@VM:~/Desktop$ ./stack
Returned Properly
```

**Image references:**
- `images/Task 1.1.png`: Generated badfile with shellcode
- `images/Task 1.2.png`: Compiled vulnerable program
- `images/Task 1.3.png`: Program execution

---

## Task 2 — Privilege Escalation
**Objective:** Obtain a root shell using a setuid-root binary (lab-controlled scenario).

**Method:** Configure the vulnerable binary as setuid-root to obtain elevated privileges for the lab demonstration.

**Example terminal output:**
```bash
[10/01/25]seed@VM:~/Desktop$ sudo chown root stack
[10/01/25]seed@VM:~/Desktop$ sudo chmod 4755 stack
[10/01/25]seed@VM:~/Desktop$ ./stack
# Root shell obtained
```

**Image references:**
- `images/Task 2.1.png`: Setuid configuration
- `images/Task 2.2.png`: Executing setuid binary
- `images/Task 2.3.png`: Privilege verification

---

## Task 3 — ASLR Defeat
**Objective:** Bypass Address Space Layout Randomization (ASLR) by using a brute-force approach.

**Method:** Enable ASLR and run a brute-force script that repeatedly attempts exploitation until success.

**Example terminal output:**
```bash
[10/01/25]seed@VM:~/Desktop$ sudo /sbin/sysctl -w kernel.randomize_va_space=2
kernel.randomize_va_space = 2
[10/01/25]seed@VM:~/Desktop$ ./brute_force.sh
Starting brute-force attack... Press Ctrl+C to stop.
Attempt: 1
Attempt: 2
...
# Successful exploitation after multiple attempts
```

**Image references:**
- `images/Task 3.1.png`: Brute force script
- `images/Task 3.2.png`: Complete ASLR bypass workflow

---

## Vulnerable Code (`stack.c`)
```c
int foo(char *str) {
    char buffer[500];
    strcpy(buffer, str);  // Buffer overflow vulnerability
    return 1;
}
```

---

## Summary of Results
- **Task 1:** Successfully exploited the buffer overflow vulnerability to control execution.
- **Task 2:** Demonstrated privilege escalation using a setuid-root configuration in a controlled lab environment.
- **Task 3:** Defeated ASLR using a brute-force technique until successful exploitation.

---

## Author
Prepared by: Abdulrahman ALQunaibit — Lab date: October 1, 2025

---

*End of README*

