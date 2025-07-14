## Customs Clearance Process Optimization


This project simulates customs clearance process optimization by comparing two algorithms: A* Search and Genetic Algorithm. 

This simulation analyzes how optimization algorithms can reduce processing times through better scheduling and pathfinding. A synthetic dataset of 100 shipments was created to model and evaluate the performance of both algorithms.


**Full report available in attached pdf file.**


## Objective

## The objective is to minimize total clearance time and improve operational efficiency through modeling features like shipment risk, document completeness, and processing time, demonstrating applications in transport network optimization and international logistics planning.

## Methods and Techniques

- Generated synthetic dataset of 100 shipments with randomly assigned risk level, document completeness, and processing time.
  
### In **A * Search Algorithm**:
- A heuristic was designed to prioritize low-risk, high-documentation shipments.
- Utilized Python's 'heapq' to simulate priority queuing and path reconstruction.

### In **Genetic Algorithm**:
- Initialized population with random shipment schedules.
- Applied fitness evaluation, selection, crossover, and mutation.
- Adaptive genetic evolution through generations to find optimal paths.

### After running both algorithms, ** *Mann-Whitney U test* ** was used to statistically evaluate the performance differences between both algorithms.

---

## Key Insights

### In **smaller datasets** of 100 shipments:

- **A * Search Algorithm** achieved **consistent customs clearance processing time** of 44 hours across all runs.

- **Genetic Algorithm** required 462–494 hours, with a best-case solution at 477 hours.

- **The Mann-Whitney U test** confirmed that **A * performed significantly better in this controlled simulation**, due to its well-defined heuristics and lower complexity features.

- **Genetic Algorithm** is more suitable for **Big Data, higher-dimensional, and rapidly-evolving regulatory environments** (which increases complexity), where Genetic Algorithm shines in adaptability.

- Algorithmic Optimization is key towards streamlining real-world customs operations, potentially reducing clearance delays, improving resource allocation, and enhancing compliance workflows.

---
