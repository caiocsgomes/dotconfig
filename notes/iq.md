- Describe what happens when you access google.com
- Describe the difference between tcp and udp
- Describe a three way handshake in tcp
- What a good terraform module looks like
- What is a docker image
- What are cgroups and namespaces in linux

1. Log File Parser

	•	Challenge: Write a Go program that reads an Apache or NGINX log file, extracts relevant fields (like IP address, request path, status code, etc.), and generates a JSON report summarizing the top 10 IP addresses that made requests and the most requested URLs.
	•	Key Concepts: File I/O, regex or string processing, JSON encoding.

2. API Response Logger

	•	Challenge: Create a Go script that periodically calls a given REST API endpoint and logs the responses into a log file. Each log entry should include a timestamp, the API endpoint called, and the full response.
	•	Key Concepts: HTTP requests, JSON handling, time management, file I/O.

3. Config File Generator

	•	Challenge: Implement a Go program that reads a template configuration file (e.g., YAML or JSON) and a set of key-value pairs from another file. The program should generate a new configuration file with the placeholders in the template replaced by the actual values.
	•	Key Concepts: File I/O, text templating, YAML/JSON parsing and generation.

4. Concurrent API Caller

	•	Challenge: Write a Go program that reads a list of URLs from a file and concurrently makes GET requests to these URLs. Save the HTTP status code and the response time for each URL in a CSV file.
	•	Key Concepts: Concurrency (goroutines, channels), HTTP requests, file generation (CSV format).

5. Log File Merger

	•	Challenge: Develop a Go tool that merges multiple log files from different servers into a single, time-ordered log file. The tool should handle different timestamp formats and ensure the final log file is sorted chronologically.
	•	Key Concepts: File I/O, time parsing and comparison, sorting algorithms.

6. API Data Aggregator

	•	Challenge: Create a Go script that consumes data from multiple REST APIs (e.g., metrics from various microservices). Aggregate the data and generate a summary report in JSON format. For example, summing up request counts or calculating the average response time across all services.
	•	Key Concepts: HTTP requests, JSON handling, data aggregation.

7. Log Rotation Script

	•	Challenge: Implement a Go program that monitors the size of a log file. When the file exceeds a certain size (e.g., 100MB), the program should rotate the log file by renaming it with a timestamp and create a new empty log file. Optionally, compress the rotated log files.
	•	Key Concepts: File I/O, file renaming, compression (optional).

8. Kubernetes Pod Log Aggregator

	•	Challenge: Write a Go program that interacts with the Kubernetes API to retrieve logs from all pods in a specific namespace. Merge these logs into a single file, prefixed with the pod name and timestamp.
	•	Key Concepts: Kubernetes API, HTTP requests, log aggregation, file I/O.

9. API Request Log Generator

	•	Challenge: Create a Go script that simulates traffic to an API by generating a large number of HTTP requests. Log each request’s details (method, URL, headers) and the corresponding response into a structured log file.
	•	Key Concepts: HTTP requests, concurrency (optional), structured logging.

10. JSON to CSV Converter

	•	Challenge: Develop a Go program that reads a large JSON file (e.g., API response dump or a configuration file) and converts it into a CSV file. Ensure that the program can handle nested JSON objects by flattening them appropriately.
	•	Key Concepts: JSON parsing, file I/O, CSV generation, data transformation.

Instructions for Practicing:

	1.	Focus on Robust Parsing: Ensure your programs can handle edge cases, such as malformed log lines or unexpected API responses.
	2.	Efficiency: For file parsing tasks, focus on memory efficiency, especially when dealing with large files.
	3.	Testing: Create various test cases, including edge cases, to validate your parsing logic.
	4.	Documentation and Comments: Properly document your code and provide clear comments, especially for sections that involve complex parsing or data transformation.
	5.	API Rate Limiting: When working with APIs, consider implementing rate limiting or exponential backoff to handle rate-limited APIs.
