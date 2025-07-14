# Customs Clearance Process Optimization


This project simulates customs clearance process optimization by comparing two algorithms: A* Search and Genetic Algorithm. 

This simulation analyzes how optimization algorithms can reduce processing times through better scheduling and pathfinding. A synthetic dataset of 100 shipments was created to model and evaluate the performance of both algorithms.


**Full report available in attached pdf file.**


## Objective

### The objective is to minimize total clearance time and improve operational efficiency through modeling features like shipment risk, document completeness, and processing time, demonstrating applications in transport network optimization and international logistics planning.

---

## Key Insights

### In **smaller datasets** of 100 shipments:

- **A * Search Algorithm** achieved **consistent customs clearance processing time** of 44 hours across all runs.

- **Genetic Algorithm** required 462–494 hours, with a best-case solution at 477 hours.

- **The Mann-Whitney U test** confirmed that **A * performed significantly better in this controlled simulation**, due to its well-defined heuristics and lower complexity features.

- **Genetic Algorithm** is more suitable for **Big Data, higher-dimensional, and rapidly-evolving regulatory environments** (which increases complexity), where Genetic Algorithm shines in adaptability.

- Algorithmic Optimization is key towards streamlining real-world customs operations, potentially reducing clearance delays, improving resource allocation, and enhancing compliance workflows.

---

## Methods and Techniques

- Generated synthetic dataset of 100 shipments with randomly assigned risk level, document completeness, and processing time.

<img width="940" height="309" alt="image" src="https://github.com/user-attachments/assets/4e9e2e94-67ce-4eba-8b7f-925a47f3370b" />

  
### In **A * Search Algorithm**:
- A **heuristic function** was designed to prioritize low-risk, high-documentation shipments.
- Utilized Python's 'heapq' to simulate priority queuing and path reconstruction.


#### Heuristic Function

<img width="761" height="155" alt="image" src="https://github.com/user-attachments/assets/3e820b03-f7ce-41e8-9b6b-698188f218f2" />


#### A* Search Algorithm, with heapq

<img width="823" height="777" alt="image" src="https://github.com/user-attachments/assets/8d42900a-bab4-40a9-9cf4-e86ead990a8e" />

#### Code used to provide best optimized pathway and the least time cost needed.
<img width="831" height="205" alt="image" src="https://github.com/user-attachments/assets/b19ca293-24cf-40c7-92a3-45344d5e15ee" />


## In **Genetic Algorithm**:
- Initialized population with random shipment schedules.
- Applied fitness evaluation, selection, crossover, and mutation.
- Adaptive genetic evolution through generations to find optimal paths.

#### Fitness Function

<img width="784" height="106" alt="image" src="https://github.com/user-attachments/assets/e6c3fbf3-8ed2-4605-884c-b37dd174fdd5" />

#### The initialization, selection, parent crossover, and mutation of population to create new solutions while ensuring variability.

<img width="940" height="461" alt="image" src="https://github.com/user-attachments/assets/3eedd055-8d01-4a2b-afd1-5c91db722aa4" />

#### Adaptive Genetic Algorithm defined to find the best optimized solution across generations.

<img width="872" height="306" alt="image" src="https://github.com/user-attachments/assets/9be6754c-2d65-49e5-90b7-42f3ce8462c7" />

#### Code used to define the adaptive genetic algorithm.

<img width="940" height="119" alt="image" src="https://github.com/user-attachments/assets/f94e0667-2e87-4d01-922e-7bdeb01c5b09" />


---

## Results & Statistical Testing

### After running both algorithms and obtaining the results, ** *Mann-Whitney U test* ** was used to statistically evaluate the performance differences between both algorithms.

### Results:

#### A* Search Algorithm

<img width="939" height="770" alt="image" src="https://github.com/user-attachments/assets/d42b18eb-7c17-4619-bf96-172fc9041d2d" />

#### Genetic Algorithm

<img width="939" height="198" alt="image" src="https://github.com/user-attachments/assets/1eace0f3-d2a0-4f59-b514-858250c228d0" />

### Statistical Testing - Mann-Whitney U Test

<img width="940" height="528" alt="image" src="https://github.com/user-attachments/assets/086ca193-69b1-44e3-87f4-b623b62dcbc5" />

---
