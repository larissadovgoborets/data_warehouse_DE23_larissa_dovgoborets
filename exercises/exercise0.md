# Exercise 0 - Introduction

In this exercise, you get to familiarize yourself with snowflake and snowsql. You will also get some overview of pricing in Snowflake. Further, you'll get an SQL repetition through querying data from snowflakes marketplace.

> [!NOTE]
> These exercises covers lectures 00-04.

## 0. Google queries

- [x] Go into marketplace under data products in snowsight. Search and get the following dataset `Google Keywords search dataset - discover all searches on Google`.

- [x] Now create a worksheet on your local repository and start querying this data through snowsql.

- [x] &nbsp; a) Use this database and find out the underlying schemas, tables and views to get an overview of its logical structure.

- [x] &nbsp; b) Find out the columns and its data types in the table `GOOGLE_KEYWORDS`.

We will now do some exploratory data analysis (EDA) of this dataset.

- [x] &nbsp; c) Find out number of rows in the dataset.

- [x] &nbsp; d) When is the first search and when is the latest search in the dataset?

- [x] &nbsp; e) Which are the 10 most popular keywords?

- [x] &nbsp; f) How many unique keywords are there?

- [x] &nbsp; g) Check what type of platforms are used and how many users per platform

- [x] &nbsp; h) Let's dive into what swedish people are searching. Go into [worldbanks country codes](https://wits.worldbank.org/wits/wits/witshelp/content/codes/country_codes.htm) to find out the country code for Sweden. Find the 20 most popular keywords and the number of searches of that keyword.

- [x] &nbsp; i) Lets see how popular spotify is around the world. List the top 10 number countries and the number of searches for spotify. For now it's okay to list the country codes, later we'll join this with the actual country to get more useful information to the stakeholders.

&nbsp; j) Feel free to do additional explorations of this dataset.

## 1. How much does it cost?

For these exercises, look up the credit cost for your snowflake edition, cloud provider and region for your snowflake account.

- [x] &nbsp; a) You have a simple workload that runs daily in Snowflake. The workload uses 0.5 credits per day. Calculate the total credit usage and cost for a 30-day month.

$0.5 * 30 = 15 (credits)$ for 30days

$15 credits  * 3.90 \$ / credit = 58.5\$$ (for 30 days)

- [x] &nbsp; b) Your workload varies throughout the month. For the first 10 days, you use 2 credits per day. For the next 10 days, you use 1.5 credits per day, and for the last 10 days, you use 1 credit per day. Calculate the total credit usage and cost for a 30-day month.

$2 credits * 10 days = 20 credits$ first 10 days

$1.5 * 10 = 15$

$20+15+10 = 45 credits$

$45 * 3.9 = 175.5\$$

- [x] &nbsp; c) You have three different warehouses running workloads simultaneously. Warehouse A is of size XS, Warehouse B is of size S, and Warehouse C is of size M. Warehouse A is used for 10h/day, B is used for 2h/day and C is used for 1h/day. Calculate the total monthly cost assuming each warehouse runs for the full 30-day month.

Warehouse A:

$10 * 1  * 30 = 300 \ credits$ (for 30 days)

$300 * 3.9\$ = 1170$ $ (for 30 days)

Warehouse B:

$2 h /day * 30 days * 2 credits/ h=  120 credits$ (for 30 days)

which will be

$120 credit * 3.9\$/ credit = 468\$$ (for 30 days)

Warehouse C:

$1h/day * 30 days * 4 credits/h = 120 credits$ (for 30 days)

$120 * 3.9 = 468\$$ (for 30 days)

TOTAL for 30 days:

$468\$ \+ 468\$ \+ 1170\$ = 2106\$$

- [x] &nbsp; d) Your Snowflake warehouse uses auto-scaling. For the first 10 days, it operates on 2 clusters for 10 hours per day. For the next 10 days, it scales up to 3 clusters for 10 hours per day. For the last 10 days, it scales up to 4 clusters for 10 hours per day. Calculate the total monthly budget. Assume the warehouse consumes 1 credit per hour per cluster.

> If you have the ability to create multi-cluster Virtual Warehouses, each Virtual Warehouse can run multiple, equal-size clusters concurrently
>and independently. The rate of Snowflake Credits charged for a multi-cluster Virtual Warehouse is calculated by multiplying the rate for the size
>of the Virtual Warehouse and the number of running clusters.

$2clusters * 10 hours/day * 10 days * 1credit/cluster = 200 credits$

For fist ten days:

$200credits * 3.9\$/credit = 780\$$

$3clusters * 10 hours/day * 10 days * 1credit/cluster = 300 credits$

For next ten days:
$300credits * 3.9\$/credit = 1170\$$

$4clusters * 10 hours/day * 10 days * 1credit/cluster = 400 credits$

For following ten days:

```math
400credits * 3.9\$ /credit = 1560\$
```

Total for 30 days:

```math
780\$ + 1170 \$+1560 \$ = 3510 \$
```

## 2. Theory questions

These study questions are good to get an overview of how snowflake works.

- [ ] &nbsp; a) What are the main components of Snowflake's architecture?

Storage layer, Compute layer, Cloud services layer, data sharing, database & SQL engine

- [ ] &nbsp; b) Explain the role of the storage layer in Snowflake.

Upscale & outscale, you pay only for storage that you use, data compression for least used storage space, data encryption, data availability.

- [ ] &nbsp; c) What is the purpose of the compute layer in Snowflake?

Consists of multiple virtual warehouses that speed up the computations by parallel processing and scaling. By separating data into different warehouses the data becomes more relevant and easier to analyse.

- [ ] &nbsp; d) How does the cloud services layer enhance the functionality of Snowflake?

Manages metadata, security, query optimization with efficient query execution, seamless scaling and secure data sharing. Automation of administrative tasks like resource management and ensures transactional consistency.

- [ ] &nbsp; e) What is a virtual warehouse in Snowflake, and how does it differ from a traditional data warehouse?

Scalable compute cluster that processes queries and performs data operations independently of storage. Compared to traditional warehouses, decouples compute and storage, thus allowing compute resources to scale elastically based on workload demand. Multiple virtual warehouses can operate concurrently on same data without interference - creates flexibility and high concurrency.

- [ ] &nbsp; f) When are the cases you would want to scale up versus scaling out in terms of virtual warehouses and compute resources.

Scale up for more powerful compute resources for complex, resource-intensive queries. Scale out (add more virtual warehouses) to distribute workloads across multiple independent compute clusters, thus increased concurrency, allowing multiple queries to run simultaneously without performance degradation.

- [ ] &nbsp; g) How does Snowflake's pricing model differ from traditional on-premise data warehousing solutions?

It's based on usage, charging separately for storage and compute resources. You pay only for what you use, and scale up and down as much as you need. Compared to traditional on-premise data warehousing, that requires upfront investment in hardware and ongoing costs for maintenance, regardless of usage.

- [ ] &nbsp; h) What is the difference between pay-as-you-go and upfront storage, and when you should you choose one over the other?

Pay-as-you-go: pay based on your actual usage of storage and compute resources. Good for fluctuating workloads and avoiding overpaying for unused capacity. Upfront storage: pay a fixed amount in advance for a set of amount storage. Cost-effective for predictable long-term storage need (risk for higher costs if you need to upscale or downscale).

- [ ] &nbsp; i) Explain the concept of Time Travel and Fail-safe in Snowflake and its use cases.

Time Travel: access and query historical versions of data within a specified retention period. Useful for recovering from mistakes, auditing changes, analyzing past data states.

Fail-safe: 7-day recovery period for data that was deleted or lost due to system failures. Data can be restored in case of emergencies or significant issues.

Use time travel to revert data to a previous state or investigate changes. Use fail-safe for critical data recovery after data loss or corruption.

## Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology       | explanation |
| ----------------- | ----------- |
| downstream        | processes or systems that receive and use data or outputs from upstream sources in a workflow or pipeline            |
| upstream          | processes or systems that generate or supply data or outputs to downstream components in a workflow or pipeline            |
| data warehouse    | centralized repository that stores large volumes of structured data from various sources, optimized for querying and reporting to support business intelligence and analytics            |
| cloud computing   | delivery of computing services, including storage, processing, and networking, over the internet, enabling scalable, on-demand resources without the need for direct infrastructure management            |
| modern data stack | collection of cloud-based tools and technologies used for data integration, storage, processing, and analysis, designed to streamline data workflows and enhance business intelligence. It typically includes components for data ingestion, data warehousing, data transformation, and analytics, leveraging scalability and flexibility of cloud infrastructure.            |
| idempotent        | operation or function that produces the same result no matter how many times it is performed, as long as the initial conditions remain unchanged. In computing, it ensures that applying the operation multiple times has the same effect as applying it once       |
| OLAP              | Online Analytical Processing - technology that allows users to interactively analyze multidimensional data from multiple perspectives, facilitating complex queries and data analysis for business intelligence. It supports fast querying and reporting by pre-aggregating data into cubes or other structures.            |
| OLTP              | Online Transaction Processing is a database processing system optimized for handling a large number of short, real-time transactions, such as insertions, updates, and deletions. It focuses on operational tasks and maintaining data integrity in real-time, typically supporting day-to-day business operations.            |
| virtual warehouse | scalable, independent compute cluster used for executing queries and data operations, separate from the storage layer. It allows for flexible scaling and isolation of workloads, enabling efficient and concurrent processing of multiple queries.            |
| external stage    | external storage location, such as Amazon S3, Google Cloud Storage, or Azure Blob Storage, used to load or unload data into or from Snowflake. It allows Snowflake to access and manage data stored outside its internal storage system.            |
| data consumer     | an individual or application that accesses and utilizes data for analysis, reporting, or decision-making. They interact with data products or services to extract insights and drive business actions.            |
| scaling out       | adding more instances or nodes of resources, such as virtual warehouses or servers, to handle increased load or improve performance. It distributes the workload across multiple resources to enhance concurrency and handle more requests simultaneously.            |
| scaling up        | increasing the capacity or power of a single resource, such as upgrading a virtual warehouse or server to a larger, more powerful instance. This improves performance and handles more intensive workloads without adding additional resources.            |
| snowflake credit  | unit of measurement used to quantify the consumption of Snowflake’s compute resources. It is charged based on the amount of time a virtual warehouse is running and the size of the warehouse, reflecting the cost of computing power used for processing queries and data operations.            |
| securable object  | entity such as a database, schema, table, or view that can have permissions or access controls applied to it. It allows administrators to manage and enforce security policies by defining who can access or modify the data and how.            |
| snowflake object  | any named entity within a Snowflake database, such as a table, view, schema, database, stage, file format, or stored procedure. These objects are used to organize, store, and manage data and metadata within the Snowflake environment.            |
| schema            | logical container within a database that organizes and groups related database objects, such as tables, views, and functions. It helps manage and structure data access and permissions by grouping objects into a namespace.            |
| permanent table   | standard table that persists data indefinitely until explicitly deleted or altered. It is designed for long-term storage and management of data, supporting features like indexing and access control.            |
| transient table   | type of table designed for temporary data storage with a lower cost compared to permanent tables. It retains data until explicitly dropped or until the session ends, but it does not support fail-safe protection, making it suitable for staging or intermediate data processing.            |
| temporary table   | session-specific table that exists only for the duration of the user's session. It is used for storing intermediate or transient data and is automatically dropped when the session ends, without incurring additional storage costs.            |
| time-travel       | allows users to access historical data and recover past states of tables, schemas, or databases within a specified retention period. This feature enables querying and restoring data as it existed at a particular point in time, useful for data recovery and auditing purposes.            |
| fail-safe         | data protection feature that provides an additional layer of data recovery beyond the time travel period. It retains a copy of data for up to seven additional days, enabling recovery from catastrophic failures or accidental data loss that occurs after the time travel period has expired.            |
| view              | virtual table that provides a predefined query result from one or more tables. It allows users to simplify complex queries, encapsulate logic, and present data in a specific format without storing the data physically.            |
| table             | fundamental database object that stores structured data in rows and columns. It is used to organize and manage data for querying, analysis, and reporting, with defined schemas to ensure data consistency and integrity.            |
| DML               | Data Manipulation Language refers to SQL commands used to manage and manipulate data within a database. Common DML operations include SELECT (retrieve data), INSERT (add new data), UPDATE (modify existing data), and DELETE (remove data).            |
| DDL               | Data Definition Language refers to SQL commands used to define and manage database structures. Common DDL operations include CREATE (establish new database objects), ALTER (modify existing objects), and DROP (remove objects).            |
| DQL               | Data Query Language refers to SQL commands used to retrieve and query data from a database. The primary DQL command is SELECT, which allows users to fetch and view data based on specified criteria.            |
| DCL               | Data Control Language refers to SQL commands used to manage permissions and access control in a database. Common DCL commands include GRANT (to assign privileges) and REVOKE (to remove privileges)            |
