# 4-Bit Combination Lock Project

This README documents the development of a 4-bit combination lock, focusing on digital design and logic circuits.

## Project Overview

The combination lock is a digital system that operates based on a pre-set 4-bit input code (X). The system allows the user to input a 4-bit value and validates it against the set combination, indicating a successful match or mismatch.

## Design and Functionality

### Set Combination

- **Input X**: A 4-bit value set by the user as the lock's combination.
- **Enter Input**: A signal to confirm the input combination.

### Lock Operation

- **Comparison Logic**: Compares the entered value with the set combination.
- **State Machine**: Manages the lock's states based on the input and comparison results.
- **Output Indicators**: Uses LED indicators to show the lock's status (locked/unlocked).


### State Machine Design

- Designed using Moore finite state machine principles.
- Responsible for handling the lock's operational states.

### Input Conditioning

- Ensures clean and debounced input signals.
- Uses hardware debounced pushbuttons for input and clock pulses.

### Simulation and Testing

- Separate simulations for each subcircuit and the final integrated design.
- Testing performed on Altera board to verify correct operation.

### Challenges and Learning Outcomes

- Designing a state machine for a practical application.
- Handling asynchronous inputs and debouncing.
- Integrating various digital components into a cohesive system.

### Conclusion

This lab provided practical experience in designing and implementing a digital combination lock, enhancing understanding of state machines, digital logic, and circuit design.
