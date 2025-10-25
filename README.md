# Automatic Tests - Robot Framework + Selenium

Automated test project for https://the-internet.herokuapp.com/ using Robot Framework and Selenium WebDriver.

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
│   ├── ab_testing.robot   # A/B Testing functionality tests
│   └── ...                # Additional test files
├── keywords/              # Keyword files (reusable functions)
│   ├── common_keywords.robot     # Common browser operations
│   ├── homepage_keywords.robot   # Homepage specific operations
│   └── ab_testing_keywords.robot # A/B Testing specific operations
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
# Run all tests
run_tests.bat

# Run only smoke tests
run_tests.bat smoke

# Run A/B Testing tests only
run_tests.bat ab_testing

# Run tests in headless mode
run_tests.bat headless
```

### Manual Execution

#### Run all tests:
```bash
python -m robot -d results tests/
```

#### Run specific test file:
```bash
python -m robot -d results tests/ab_testing.robot
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
# Run only smoke tests
python -m robot -i smoke -d results tests/

# Run tests excluding slow ones
python -m robot -e slow -d results tests/

# Run specific functionality tests
python -m robot -i ab_testing -d results tests/
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

## Contributing

1. Create feature branch from `develop`
2. Add tests following existing patterns
3. Ensure all tests pass locally
4. Submit pull request with clear description

## Useful Links

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [The Internet - Test Application](https://the-internet.herokuapp.com/)
- [Robot Framework Syntax](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-data-syntax)
