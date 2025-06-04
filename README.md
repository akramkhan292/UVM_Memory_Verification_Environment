# UVM Memory Testbench Project

This project implements a **Universal Verification Methodology (UVM)**-based testbench for verifying a simple memory interface using SystemVerilog. The design includes components such as a driver, monitor, scoreboard, and sequence to verify read and write operations to a memory DUT.

🔗 **Live Simulation**: [Run on EDA Playground](https://edaplayground.com/x/CsKS)

---

## 📁 Project Structure

| File                  | Description                                           |
|-----------------------|-------------------------------------------------------|
| `mem_if.sv`           | SystemVerilog interface for DUT and testbench         |
| `mem_dut.sv`          | Design Under Test - Simple memory block               |
| `mem_seq_item.sv`     | Defines memory transaction (addr, wr_en, rd_en, etc.) |
| `mem_sequence.sv`     | Generates memory read/write sequences                 |
| `mem_driver.sv`       | Drives transactions to DUT                            |
| `mem_monitor.sv`      | Captures DUT behavior and sends to scoreboard         |
| `mem_scoreboard.sv`   | Compares expected vs actual results                   |
| `mem_agent.sv`        | Wraps driver, monitor, and sequencer into one unit    |
| `mem_env.sv`          | Instantiates the agent and scoreboard                 |
| `mem_test.sv`         | Top-level test that runs the environment              |
| `mem_base_test.sv`    | Adds fatal/error check for test result                |
| `mem_top.sv`          | Testbench top module, connects DUT and interface      |

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

## 👤 Author

**Mohd Akram Khan**  

---

�� *Built using UVM methodology for functional verification of digital memory interfaces.*

