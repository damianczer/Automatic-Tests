# 🤖 Automatic Smoke Tests - Robot Framework & Selenium & Web Driver

![GitHub stars](https://img.shields.io/github/stars/damianczer/automatic-tests?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/damianczer/automatic-tests?style=social)
![GitHub issues](https://img.shields.io/github/issues/damianczer/automatic-tests?style=flat-square)

## 👨‍💻 Author

[Damian Czerwiński](https://github.com/damianczer/)

---


> **Production-ready test automation suite with comprehensive web testing scenarios**

Automated test project for https://the-internet.herokuapp.com/ using Robot Framework and Selenium WebDriver. This project demonstrates best practices in test automation with a focus on maintainability, scalability, and CI/CD integration.

## 🎯 What is this project?

This is a **complete test automation framework** that provides:
- ✅ **Ready-to-use test suites** for common web testing scenarios
- ✅ **Cross-browser testing** (Chrome, Firefox, Headless mode)
- ✅ **CI/CD integration** with GitHub Actions
- ✅ **Comprehensive reporting** with HTML reports and logs
- ✅ **Modular architecture** with reusable keywords and page objects

## 🛠️ Technologies Used

- Robot Framework - [User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- Selenium Library - [Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- The Internet [Test Application](https://the-internet.herokuapp.com/)
- Robot - [Syntax](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-data-syntax)

---

## 🚀 What's included?

### Test Coverage
Currently implemented test suites covering **29 test scenarios**:

| Test Suite | Test Cases | Coverage |
|------------|------------|----------|
| **A/B Testing** | 5 scenarios | Variant testing, page refresh, content validation |
| **Add/Remove Elements** | 8 scenarios | DOM manipulation, performance testing |
| **Basic Auth** | 8 scenarios | HTTP authentication, security validation |
| **Checkboxes** | 8 scenarios | Form elements, state management, persistence testing |

### Key Features
- 🔍 **Smoke tests** for critical functionality validation
- 🌐 **Cross-browser compatibility** testing
- 📊 **Performance testing** scenarios
- 🔐 **Security testing** with authentication flows
- 📱 **Headless mode** for CI/CD environments
- 🎯 **Tag-based test execution** for targeted testing

## 🧑🏻‍💻 Example

<img width="692" height="312" alt="image" src="https://github.com/user-attachments/assets/3586fcf9-ad17-46ca-810c-7efd01138b34" />

Raport:

<img width="913" height="890" alt="image" src="https://github.com/user-attachments/assets/af25dfc8-8fcf-4112-afc3-c300d6613a3d" />



## 📈 Test Results Dashboard

```
Total Tests: 21     ✅ Passing: 21     ❌ Failing: 0     Success Rate: 100%
```

**Latest Test Run Results:**
- **Smoke Tests**: 6/6 passing ✅
- **A/B Testing**: 5/5 passing ✅
- **Add/Remove Elements**: 8/8 passing ✅
- **Basic Auth**: 8/8 passing ✅

## 🎬 Quick Demo

```bash
# Clone and run in 3 commands
git clone <repository-url>
cd Automatic-Tests
pip install -r requirements.txt

# Run smoke tests (takes ~2 minutes)
run_tests.bat smoke
```

## 💡 Why use this project?

- **Learning**: Perfect for learning Robot Framework and Selenium best practices
- **Template**: Use as a starting point for your own test automation projects
- **Examples**: Real-world examples of common testing scenarios
- **Production-ready**: Includes CI/CD, reporting, and error handling
- **Maintainable**: Clean architecture with separated concerns

## Prerequisites

- Python 3.8 or higher
- pip (Python package manager)
- Google Chrome or Firefox browser
- Git (for cloning the repository)

## Installation

### Step 1: Clone the repository
```bash
git clone <repository-url>
cd Automatic-Tests
```

### Step 2: Create virtual environment (recommended)
```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate
```

### Step 3: Install dependencies
```bash
pip install -r requirements.txt
```

## Project Structure

```
Automatic-Tests/
├── tests/                 # Test files (.robot)
│   ├── ab_testing.robot   # A/B Testing functionality tests (5 tests)
│   ├── add_remove_elements.robot  # Add/Remove Elements tests (8 tests)
│   ├── basic_auth.robot   # Basic Auth functionality tests (8 tests)
│   └── ...                # Additional test files
├── keywords/              # Keyword files (reusable functions)
│   ├── common_keywords.robot     # Common browser operations
│   ├── homepage_keywords.robot   # Homepage specific operations
│   ├── ab_testing_keywords.robot # A/B Testing specific operations
│   ├── add_remove_keywords.robot # Add/Remove Elements operations
│   ├── basic_auth_keywords.robot # Basic Auth operations
│   └── ...                # Additional keyword files
├── resources/             # Resource files (variables, configuration)
│   └── variables.robot    # Global variables and URLs
├── results/               # Test results (generated automatically)
├── .github/workflows/     # CI/CD configuration
├── requirements.txt       # Python dependencies
├── robot.yaml            # Robot Framework configuration
├── run_tests.bat         # Windows batch script for easy test execution
└── README.md             # This file
```

## Running Tests

### Quick Start (Windows)
Use the provided batch script for easy test execution:
```cmd
# Run all tests (29 test cases)
run_tests.bat

# Run only smoke tests (8 critical test cases)
run_tests.bat smoke

# Run A/B Testing tests only (5 test cases)
run_tests.bat ab_testing

# Run Add/Remove Elements tests only (8 test cases)
run_tests.bat add_remove

# Run Basic Auth tests only (8 test cases)
run_tests.bat basic_auth

# Run Checkboxes tests only (8 test cases)
run_tests.bat checkboxes
run_tests.bat add_remove

# Run Basic Auth tests only (8 test cases)
run_tests.bat basic_auth

# Run tests in headless mode (no browser window)
run_tests.bat headless
```

### Manual Execution

#### Run all tests:
```bash
python -m robot -d results tests/
```

#### Run specific test file:
```bash
# A/B Testing (5 test cases)
python -m robot -d results tests/ab_testing.robot

# Add/Remove Elements (8 test cases)
python -m robot -d results tests/add_remove_elements.robot

# Basic Auth (8 test cases)
python -m robot -d results tests/basic_auth.robot
```

#### Run tests with specific browser:
```bash
# Chrome (default)
python -m robot -v BROWSER:chrome -d results tests/

# Firefox
python -m robot -v BROWSER:firefox -d results tests/

# Headless Chrome
python -m robot -v BROWSER:chrome -v HEADLESS:True -d results tests/
```

#### Run tests with tags:
```bash
# Run only smoke tests (6 test cases)
python -m robot -i smoke -d results tests/

# Run authentication tests (8 test cases)
python -m robot -i authentication -d results tests/

# Run functionality tests (multiple test cases)
python -m robot -i functionality -d results tests/

# Run tests excluding slow ones
python -m robot -e slow -d results tests/

# Run specific functionality tests
python -m robot -i ab_testing -d results tests/
python -m robot -i basic_auth -d results tests/
```

## Test Results

After running tests, results are available in the `results/` directory:
- **report.html** - High-level test report
- **log.html** - Detailed execution log
- **output.xml** - Machine-readable results

### Opening Results
```bash
# Open report in default browser (Windows)
start results/report.html

# Open detailed log
start results/log.html
```

## Configuration

### Browser Configuration
Edit `resources/variables.robot` to change default settings:
```robot
${BROWSER}               chrome        # Default browser
${HEADLESS}              False         # Run in headless mode
${IMPLICIT_WAIT}         10            # Default wait time
${WINDOW_WIDTH}          1920          # Browser window width
${WINDOW_HEIGHT}         1080          # Browser window height
```

### Test Configuration
Edit `robot.yaml` for global Robot Framework settings.

## Available Test Suites

### A/B Testing (`tests/ab_testing.robot`)
Tests the A/B Testing functionality on the-internet.herokuapp.com:
- TC001: Check A/B Testing link availability on homepage
- TC002: Navigate from homepage to A/B Testing page
- TC003: Verify A/B Testing page content
- TC004: Check A/B Testing variant display
- TC005: Test page refresh behavior

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `ab_testing`, `refresh`

### Add/Remove Elements (`tests/add_remove_elements.robot`)
Tests dynamic DOM manipulation functionality:
- TC001: Check Add/Remove Elements link availability on homepage
- TC002: Navigate to Add/Remove Elements page
- TC003: Verify basic page functionality
- TC004: Add single element
- TC005: Add and remove element (full cycle)
- TC006: Add multiple elements
- TC007: Remove all elements
- TC008: Performance test with many elements

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `performance`, `add_remove`

### Basic Auth (`tests/basic_auth.robot`)
Tests HTTP Basic Authentication functionality:
- TC001: Check Basic Auth link availability on homepage
- TC002: Navigate to Basic Auth page with credentials
- TC003: Verify Basic Auth success page content
- TC004: Basic Auth via homepage navigation
- TC005: Multiple Basic Auth access attempts
- TC006: Basic Auth page refresh behavior
- TC007: Basic Auth URL structure validation
- TC008: Basic Auth security headers check

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `authentication`, `security`, `basic_auth`

## Best Practices

1. **Test Organization**: One .robot file per functionality
2. **Keywords**: Use descriptive English keyword names
3. **Variables**: Define variables in resources files
4. **Page Objects**: Use Page Object Model pattern for larger applications
5. **Waits**: Always use proper waits instead of sleep
6. **Tags**: Use tags to categorize and filter tests

## Troubleshooting

### Common Issues

#### "robot" command not found
Use `python -m robot` instead of just `robot`.

#### Browser driver issues
The project uses webdriver-manager to automatically download browser drivers. If you encounter issues:
1. Ensure you have Chrome or Firefox installed
2. Check your internet connection
3. Try running in headless mode

#### Permission errors on Windows
Run command prompt as Administrator or use PowerShell.

#### Tests failing due to network issues
Check your internet connection and try running individual tests:
```bash
python -m robot -t "TC001*" -d results tests/ab_testing.robot
```

### Debug Mode
Run individual test cases for debugging:
```bash
# Run specific test case
python -m robot -t "TC001 - Check A/B Testing Link Availability*" -d results tests/ab_testing.robot

# Run with more verbose logging
python -m robot -L DEBUG -d results tests/ab_testing.robot
```

## Continuous Integration

The project includes GitHub Actions workflow (`.github/workflows/robot-tests.yml`) that:
- Runs tests on push to main/develop branches
- Tests with both Chrome and Firefox
- Runs daily at 6:00 UTC
- Uploads test results as artifacts
