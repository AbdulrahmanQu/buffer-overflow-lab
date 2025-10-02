# Lab 1 — Buffer Overflow Report

## Overview

This lab demonstrates stack-based buffer overflow vulnerabilities on a 32-bit Linux system. The objectives were to exploit a vulnerable program, obtain elevated privileges, and bypass ASLR protection.

---

## Prerequisites

* 32-bit Linux VM (lab environment)
* gcc (with ability to set Exec stack)
* Python 3

---

## Repository / Files

* `stack.c` — vulnerable program used in the lab
* `exploit2.py` — Python exploit used to generate `badfile`
* `brute_force.sh` — brute-force script used to defeat ASLR
* Image references (images are stored in the `images/` folder): `Task 1.1.png`, `Task 1.2.png`, `Task 1.3.png`, `Task 2.1.png`, `Task 2.2.png`, `Task 2.3.png`, `Task 3.1.png`, `Task 3.2.png`

---

## Task 1 — Basic Buffer Overflow

**Objective:** Exploit a vulnerable program to execute arbitrary code.

**Exploit approach:**

* Determined the correct return address offset via debugging.
* Placed shellcode at an appropriate position in the payload.
* Configured a NOP sled to improve reliability.

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

**Task 1**

Generated badfile with shellcode

![Task 1.1](images/Task%201.1.png)

**Task 2**

Setuid configuration (privilege escalation)

![Task 2.1](images/Task%202.1.png)

**Task 3**

Brute force script (ASLR defeat)

![Task 3.1](images/Task%203.1.png)
![Task 3.2](images/Task%203.2.png)
![Task 3.3](images/Task%203.3.png)
![Task 3.4](images/Task%203.4.png)
![Task 3.5](images/Task%203.5.png)
![Task 3.6](images/Task%203.6.png)

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

* **Task 1:** Successfully exploited the buffer overflow vulnerability to control execution.
* **Task 2:** Demonstrated privilege escalation using a setuid-root configuration in a controlled lab environment.
* **Task 3:** Defeated ASLR using a brute-force technique until successful exploitation.

---

## Author

Prepared by: Abdulrahman ALQunaibit — Lab date: October 1, 2025

---

*End of README*
