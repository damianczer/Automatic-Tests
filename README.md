# Automatic Smoke Tests - Robot Framework & Selenium & Web Driver

![GitHub stars](https://img.shields.io/github/stars/damianczer/automatic-tests?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/damianczer/automatic-tests?style=social)
![GitHub issues](https://img.shields.io/github/issues/damianczer/automatic-tests?style=flat-square)

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

## 🚀 What's included?

### Test Coverage
Currently implemented test suites covering **85 test scenarios**:

| Test Suite | Test Cases | Coverage |
|------------|------------|----------|
| **A/B Testing** | 5 scenarios | Variant testing, page refresh, content validation |
| **Add/Remove Elements** | 8 scenarios | DOM manipulation, performance testing |
| **Basic Auth** | 8 scenarios | HTTP authentication, security validation |
| **Checkboxes** | 8 scenarios | Form elements, state management, persistence testing |
| **Context Menu** | 8 scenarios | Mouse interactions, element properties, UI testing |
| **Dropdown** | 8 scenarios | Select elements, form validation, option management |
| **Drag and Drop** | 8 scenarios | Element manipulation, drag interactions, UI controls |
| **File Upload** | 8 scenarios | File handling, form submissions, upload validation |
| **JavaScript Alerts** | 8 scenarios | Alert dialogs, confirm dialogs, prompt dialogs |
| **Dynamic Loading** | 8 scenarios | Dynamic content loading, element visibility, AJAX testing |
| **Hovers** | 8 scenarios | Mouse hover interactions, tooltip display, UI feedback |

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

```bash
Total Tests: 85     ✅ Passing: 85     ❌ Failing: 0     Success Rate: 100%
```

**Latest Test Run Results:**
- **Smoke Tests**: 16/16 passing ✅
- **A/B Testing**: 5/5 passing ✅
- **Add/Remove Elements**: 8/8 passing ✅
- **Basic Auth**: 8/8 passing ✅
- **Checkboxes**: 8/8 passing ✅
- **Context Menu**: 8/8 passing ✅
- **Dropdown**: 8/8 passing ✅
- **Drag and Drop**: 8/8 passing ✅
- **File Upload**: 8/8 passing ✅
- **JavaScript Alerts**: 8/8 passing ✅
- **Dynamic Loading**: 8/8 passing ✅
- **Hovers**: 8/8 passing ✅

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
│   ├── checkboxes.robot   # Checkboxes functionality tests (8 tests)
│   ├── context_menu.robot # Context Menu functionality tests (8 tests)
│   ├── dropdown.robot     # Dropdown functionality tests (8 tests)
│   ├── drag_and_drop.robot # Drag and Drop functionality tests (8 tests)
│   ├── file_upload.robot  # File Upload functionality tests (8 tests)
│   ├── javascript_alerts.robot # JavaScript Alerts functionality tests (8 tests)
│   ├── dynamic_loading.robot # Dynamic Loading functionality tests (8 tests)
│   ├── hovers.robot       # Hovers functionality tests (8 tests)
│   └── ...                # Additional test files
├── keywords/              # Keyword files (reusable functions)
│   ├── common_keywords.robot     # Common browser operations
│   ├── homepage_keywords.robot   # Homepage specific operations
│   ├── ab_testing_keywords.robot # A/B Testing specific operations
│   ├── add_remove_keywords.robot # Add/Remove Elements operations
│   ├── basic_auth_keywords.robot # Basic Auth operations
│   ├── checkboxes_keywords.robot # Checkboxes operations
│   ├── context_menu_keywords.robot # Context Menu operations
│   ├── dropdown_keywords.robot   # Dropdown operations
│   ├── drag_and_drop_keywords.robot # Drag and Drop operations
│   ├── file_upload_keywords.robot # File Upload operations
│   ├── javascript_alerts_keywords.robot # JavaScript Alerts operations
│   ├── dynamic_loading_keywords.robot # Dynamic Loading operations
│   ├── hovers_keywords.robot     # Hovers operations
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
# Run all tests (85 test cases)
run_tests.bat

# Run only smoke tests (16 critical test cases)
run_tests.bat smoke

# Run A/B Testing tests only (5 test cases)
run_tests.bat ab_testing

# Run Add/Remove Elements tests only (8 test cases)
run_tests.bat add_remove

# Run Basic Auth tests only (8 test cases)
run_tests.bat basic_auth

# Run Checkboxes tests only (8 test cases)
run_tests.bat checkboxes

# Run Context Menu tests only (8 test cases)
run_tests.bat context_menu

# Run Dropdown tests only (8 test cases)
run_tests.bat dropdown

# Run Drag and Drop tests only (8 test cases)
run_tests.bat drag_and_drop

# Run File Upload tests only (8 test cases)
run_tests.bat file_upload

# Run JavaScript Alerts tests only (8 test cases)
run_tests.bat javascript_alerts

# Run Dynamic Loading tests only (8 test cases)
run_tests.bat dynamic_loading

# Run Hovers tests only (8 test cases)
run_tests.bat hovers

# Run in headless mode
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

# Checkboxes (8 test cases)
python -m robot -d results tests/checkboxes.robot

# Context Menu (8 test cases)
python -m robot -d results tests/context_menu.robot

# Dropdown (8 test cases)
python -m robot -d results tests/dropdown.robot

# Drag and Drop (8 test cases)
python -m robot -d results tests/drag_and_drop.robot

# File Upload (8 test cases)
python -m robot -d results tests/file_upload.robot

# JavaScript Alerts (8 test cases)
python -m robot -d results tests/javascript_alerts.robot

# Dynamic Loading (8 test cases)
python -m robot -d results tests/dynamic_loading.robot

# Hovers (8 test cases)
python -m robot -d results tests/hovers.robot
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
# Run only smoke tests (16 test cases)
python -m robot -i smoke -d results tests/

# Run authentication tests (Basic Auth - 8 test cases)
python -m robot -i authentication -d results tests/

# Run functionality tests (multiple test cases)
python -m robot -i functionality -d results tests/

# Run form elements tests
python -m robot -i forms -d results tests/

# Run tests excluding slow ones
python -m robot -e slow -d results tests/

# Run specific functionality tests
python -m robot -i ab_testing -d results tests/
python -m robot -i basic_auth -d results tests/
python -m robot -i checkboxes -d results tests/
python -m robot -i context_menu -d results tests/
python -m robot -i dropdown -d results tests/
python -m robot -i drag_and_drop -d results tests/
python -m robot -i file_upload -d results tests/
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

### Checkboxes (`tests/checkboxes.robot`)
Tests form elements and checkbox state management:
- TC001: Check Checkboxes link availability on homepage
- TC002: Navigate to Checkboxes page
- TC003: Verify Checkboxes page content
- TC004: Check initial checkbox states
- TC005: Toggle first checkbox
- TC006: Toggle second checkbox
- TC007: Multiple checkbox operations
- TC008: Checkbox persistence test

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `forms`, `checkboxes`

### Context Menu (`tests/context_menu.robot`)
Tests context menu interactions and mouse event handling:
- TC001: Check Context Menu link availability on homepage
- TC002: Navigate to Context Menu page
- TC003: Verify Context Menu page content
- TC004: Test right click context menu alert (element interaction)
- TC005: Test context menu element interaction
- TC006: Test context menu box properties
- TC007: Multiple context menu box interactions
- TC008: Context menu page elements verification

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `interaction`, `context_menu`

### Dropdown (`tests/dropdown.robot`)
Tests dropdown/select element functionality and form interactions:
- TC001: Check Dropdown link availability on homepage
- TC002: Navigate to Dropdown page
- TC003: Verify Dropdown page content
- TC004: Verify dropdown default state
- TC005: Select Option 1 from dropdown
- TC006: Select Option 2 from dropdown
- TC007: Multiple dropdown selections
- TC008: Dropdown options verification

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `forms`, `dropdown`

### Drag and Drop (`tests/drag_and_drop.robot`)
Tests drag and drop interactions and element manipulation:
- TC001: Check Drag and Drop link availability on homepage
- TC002: Navigate to Drag and Drop page
- TC003: Verify Drag and Drop page content
- TC004: Verify initial state of drag and drop elements
- TC005: Drag element from column A to column B
- TC006: Drag element from column B to column A
- TC007: Multiple drag and drop operations
- TC008: Drag and drop elements properties verification

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `interaction`, `drag_and_drop`

### File Upload (`tests/file_upload.robot`)
Tests file upload functionality and form submissions:
- TC001: Check File Upload link availability on homepage
- TC002: Navigate to File Upload page
- TC003: Verify File Upload page content
- TC004: Verify file upload elements properties
- TC005: Upload text file
- TC006: Upload different file types
- TC007: Multiple file upload operations
- TC008: File upload form validation

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `forms`, `file_upload`

### JavaScript Alerts (`tests/javascript_alerts.robot`)
Tests JavaScript alert dialogs, confirm dialogs, and prompt dialogs:
- TC001: Check JavaScript Alerts link availability on homepage
- TC002: Navigate to JavaScript Alerts page
- TC003: Verify JavaScript Alerts page content
- TC004: Test JavaScript Alert dialog
- TC005: Test JavaScript Confirm dialog accept
- TC006: Test JavaScript Confirm dialog dismiss
- TC007: Test JavaScript Prompt dialog
- TC008: Multiple JavaScript alerts operations

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `alerts`, `javascript_alerts`

### Dynamic Loading (`tests/dynamic_loading.robot`)
Tests dynamic content loading and element visibility changes:
- TC001: Check Dynamic Loading link availability on homepage
- TC002: Navigate to Dynamic Loading page
- TC003: Verify Dynamic Loading page content
- TC004: Test dynamic loading Example 1 - hidden element
- TC005: Test dynamic loading Example 2 - rendered element
- TC006: Verify loading states Example 1
- TC007: Verify loading states Example 2
- TC008: Multiple dynamic loading operations

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `ajax`, `dynamic_loading`

### Hovers (`tests/hovers.robot`)
Tests mouse hover interactions and tooltip display:
- TC001: Check Hovers link availability on homepage
- TC002: Navigate to Hovers page
- TC003: Verify Hovers page content
- TC004: Test hover on User 1
- TC005: Test hover on User 2
- TC006: Test hover on User 3
- TC007: Verify user profile links
- TC008: Multiple hover operations

**Tags:** `smoke`, `navigation`, `content`, `functionality`, `interactions`, `hovers`

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
