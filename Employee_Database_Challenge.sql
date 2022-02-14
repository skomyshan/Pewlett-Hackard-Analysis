-- Deliverable #1
SELECT e.emp_no, e.first_name, e.last_name,
		t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name,
                    title, to_date
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT count(title) "count", title
INTO retiring_titles
FROM unique_titles
GROUP by title
ORDER BY count DESC;

-- Deliverable #2
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;