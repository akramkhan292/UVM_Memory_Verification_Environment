# UVM Memory Testbench Project

This project implements a **Universal Verification Methodology (UVM)**-based testbench for verifying a simple memory interface using SystemVerilog. The design includes components such as a driver, monitor, scoreboard, and sequence to verify read and write operations to a memory DUT.

🔗 **Live Simulation**: [Run on EDA Playground](https://edaplayground.com/x/CsKS)

---

## 📁 Project Structure

```text
UVM_Memory_Verification_Environment/
├── src/
│   ├── interface.sv          # SystemVerilog interface for DUT and testbench
│   ├── sequence_item.sv      # Defines memory transaction (addr, wr_en, rd_en, etc.)
│   ├── sequence.sv           # Generates memory read/write sequences
│   ├── sequencer.sv          # Coordinates and controls sequence generation.
│   ├── driver.sv             # Drives transactions to DUT
│   ├── monitor.sv            # Captures DUT behavior and sends to scoreboard
│   ├── scoreboard.sv         # Verifies correctness
│   ├── agent.sv              # Wraps driver, monitor, and sequencer into one unit
│   ├── enviroment.sv         # Instantiates the agent and scoreboard
│   ├── mem_base_test.sv      # Adds fatal/error check for test result
│   ├── rd_wr_test.sv         # Top-level test that runs the environment
│   ├── design.sv             # Design Under Test - Simple memory block
│   ├── 
├── testbench/
│   └── testbench.sv          # Top-level testbench
├── README.md
└── .gitignore
```

---

## 🛠 How to Run

1. Open [EDAPLAYGROUND - Memory Testbench](https://edaplayground.com/x/CsKS)
2. Click **Run**
3. Check console output to view read/write results and test status

---

## ✅ Key Features

- 🧱 Modular and reusable UVM testbench architecture
- �� Memory read and write sequences
- ✅ Scoreboard-based result checking
- 🧩 Interface-based connection between DUT and UVM components
- 🛑 Automatic check for `UVM_FATAL` and `UVM_ERROR` in base test

---

## Requirements
- SystemVerilog simulator with UVM support, e.g.:  
  - Synopsys VCS  
  - Cadence Xcelium  
  - Mentor QuestaSim  
- UVM library version 1.2 or later  
- Operating System: Linux, Windows, or macOS  
- Basic familiarity with SystemVerilog and UVM  
- Optional: Python (for automation scripts and coverage analysis)  

---

## Getting Started
1. Clone the repository:  
   `git clone https://github.com/akramkhan292/UVM_Memory_Verification_Environment.git`  
2. Setup your simulator environment and licensing.  
3. Compile source and testbench files per your simulator’s guidelines.  
4. Run simulations using provided scripts or manual commands.  
5. Modify or add test cases inside the `tests` directory as needed. 

---
## Contact
Mohd Akram Khan  
GitHub: [https://github.com/akramkhan292](https://github.com/akramkhan292)

---

## 👤 Author

**Mohd Akram Khan**  


---

�� *Built using UVM methodology for functional verification of digital memory interfaces.*

