# Employee-Performance-and-Database-Reporting-for-scienceQtech

### Company: ScienceQTech
### Department Request: Human Resources and Management
### Datasets provided: 
- [data_science_team.csv](data_science_team.csv)
- [proj_table.csv](proj_table.csv)
- [emp_record_table.csv](emp_record_table.csv)

### Problem Scenario: 
ScienceQtech is a rapidly growing startup operating in the Data Science domain, working on high-impact projects such as: fraud detection, market basket, self-driving cars, supply chain, algorithmic early detection of lung cancer, customer sentiment, and the drug discovery field. With the annual appraisal cycle approaching, the HR department has requested assistance in analyzing the employee database. The goal is to generate comprehensive reports that cover employee performance, salary insights, and project participation.

### Goal:
This project aims to automate key HR insights through SQL queries and stored logic, enabling better data-driven decisions during the appraisal cycle. 
Your work will directly influence:
- Performance mapping
- Compensation reviews
- Training allocation
- Workforce planning

Ultimately, these insights will contribute to the overall performance, fairness, and productivity of ScienceQtech.

### Tasks to be performed:
| Task #      | Task Description                                 | SQL Query                           | Result CSV                                                            |
| ----------- | ------------------------------------------------ | ----------------------------------- | --------------------------------------------------------------------- |
| **Task 1**  | Basic employee details                           | [View Query](emp_record.md#task-1)  | [View Result](results/basic%20employee%20details.csv)                 |
| **Task 2**  | Filter employees by rating                       | [View Query](emp_record.md#task-2)  | [View Result](results/filter%20employees%20by%20rating.csv)           |
| **Task 3**  | Concatenate FIRST_NAME + LAST_NAME               | [View Query](emp_record.md#task-3)  | [View Result](results/concatenate%20employee%20names.csv)             |
| **Task 4**  | Employees who have reporters                     | [View Query](emp_record.md#task-4)  | [View Result](results/employees%20with%20reporters.csv)               |
| **Task 5**  | Finance + Healthcare employees (UNION)           | [View Query](emp_record.md#task-5)  | [View Result](results/finance%20and%20healthcare%20employees.csv)     |
| **Task 6**  | Max rating per department                        | [View Query](emp_record.md#task-6)  | [View Result](results/max%20rating%20per%20department.csv)            |
| **Task 7**  | Min/Max salary per role                          | [View Query](emp_record.md#task-7)  | [View Result](results/minmax%20salary%20by%20role.csv)                |
| **Task 8**  | Rank employees by experience                     | [View Query](emp_record.md#task-8)  | [View Result](results/rank%20employees%20by%20experience.csv)         |
| **Task 9**  | View for employees with salary > 6000            | [View Query](emp_record.md#task-9)  | [View Result](results/employees%20with%20salary%20over%206000.csv)    |
| **Task 10** | Nested query: EXP > 10 years                     | [View Query](emp_record.md#task-10) | [View Result](results/employees%20with%20exp%20over%2010%20years.csv) |
| **Task 11** | Stored procedure: EXP > 3                        | [View Query](emp_record.md#task-11) | [View Result](results/stored%20procedure%20exp%20over%203.csv)        |
| **Task 12** | Stored function: Data Science profile validation | [View Query](emp_record.md#task-12) | [View Result](results/data%20science%20profile%20validation.csv)      |
| **Task 13** | Index creation for optimization                  | [View Query](emp_record.md#task-13) | [View Result](results/index%20creation%20optimization.csv)            |
| **Task 14** | Bonus calculation (5% × rating)                  | [View Query](emp_record.md#task-14) | [View Result](results/bonus%20calculation.csv)                        |
| **Task 15** | Average salary by continent & country            | [View Query](emp_record.md#task-15) | [View Result](results/average%20salary%20by%20region.csv)             |



