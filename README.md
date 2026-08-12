# 👥 HR Management

A desktop HR app built with JavaFX and MySQL — log in, then manage employee
records and their salaries. Written while learning JavaFX and JDBC.

![Java](https://img.shields.io/badge/Java-17-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
![JavaFX](https://img.shields.io/badge/JavaFX-17.0.6-5382A1?style=flat-square)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)

## What it does

- **Login screen** with email format checking and an error message for bad
  credentials
- **Dashboard** to move between the employee and salary screens, or log out
- **Employees** — add, update, delete and list employees in a table
- **Salaries** — add, update, delete and list salary entries, linked to an
  employee by ID

## Setting it up

You'll need JDK 17 and a running MySQL server.

**1. Create the database**

```bash
mysql -u root -p < schema.sql
```

This creates `hr_management_db` with the two tables the app expects, plus a
couple of sample rows.

**2. Check the connection details**

The app connects as `root` with an empty password on `localhost:3306`. If your
MySQL setup differs you'll need to change that — see [Known issues](#known-issues).

**3. Run it**

```bash
./mvnw javafx:run
```

**Login details** (these are hardcoded for now):

| Email | Password |
| --- | --- |
| `user@gmail.com` | `pass` |
| `root@gmail.com` | `toor` |

## How it's organised

```
src/main/java/.../
├── HelloApplication.java      # starts the app, loads the login screen
├── LogInController.java       # checks credentials, opens the dashboard
├── DashboardController.java   # navigation between screens
├── EmployeeController.java    # employee CRUD
├── SalaryController.java      # salary CRUD
└── Model/
    ├── EmployeeORM.java       # one employee row
    └── SalaryORM.java         # one salary row
```

The FXML files in `src/main/resources/` hold the layouts. Each controller takes
the `primaryStage` passed down from the one before it, so switching screens
swaps the scene on that single window rather than opening new ones.

The table views use `PropertyValueFactory` bound to an `ObservableList`, so the
table redraws itself whenever the list changes — which is why `updateButton` and
`deleteButton` call `viewButton()` when they finish.

## Known issues

- **The database details are copy-pasted into every method.** The JDBC URL, user
  and password appear five separate times in `EmployeeController` alone. Pulling
  them into one place is the obvious next cleanup.
- **Login details are hardcoded in the controller** as plain text, and the map is
  rebuilt on every login attempt. They should come from the database.
- **`viewButton()` doesn't run on open** — the employee and salary tables start
  empty until you press View.
- The GitHub description still says the dashboard isn't wired up. It is now.

## What I want to add

- [ ] Move the database settings into a config file
- [ ] Store users in the database with hashed passwords
- [ ] Load the tables automatically when a screen opens
- [ ] Search and sort on the employee table
- [ ] Better styling — it's all default JavaFX right now
