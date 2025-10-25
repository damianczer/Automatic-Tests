# Quick Reference Guide - Robot Framework Test Project

## ✅ Project Status
- ✅ Working A/B Testing tests (5 test cases)
- ✅ Working Add/Remove Elements tests (8 test cases)
- ✅ Working Basic Auth tests (8 test cases)
- ✅ Proper project structure with best practices
- ✅ CI/CD pipeline configured
- ✅ Cross-browser support (Chrome, Firefox)

## 🚀 Quick Start Commands

### Basic Usage
```cmd
# Run all tests
run_tests.bat

# Run smoke tests only
run_tests.bat smoke

# Run A/B Testing tests only
run_tests.bat ab_testing

# Run Add/Remove Elements tests only
run_tests.bat add_remove

# Run Basic Auth tests only
run_tests.bat basic_auth

# Run in headless mode
run_tests.bat headless
```

### Advanced Usage
```cmd
# Run specific test file
python -m robot -d results tests/ab_testing.robot

# Run with specific browser
python -m robot -v BROWSER:firefox -d results tests/

# Run tests with tags
python -m robot -i smoke -d results tests/
python -m robot -i functionality -d results tests/
python -m robot -i authentication -d results tests/
python -m robot -e slow -d results tests/

# Run specific test case
python -m robot -t "TC001*" -d results tests/ab_testing.robot

# Run in debug mode
python -m robot -L DEBUG -d results tests/
```

## 📊 Available Test Suites

### A/B Testing (`tests/ab_testing.robot`)
- **TC001**: Check A/B Testing link availability on homepage
- **TC002**: Navigate to A/B Testing page  
- **TC003**: Verify A/B Testing page content
- **TC004**: Check A/B Testing variant display
- **TC005**: Test page refresh behavior

### Add/Remove Elements (`tests/add_remove_elements.robot`)
- **TC001**: Check Add/Remove Elements link availability
- **TC002**: Navigate to Add/Remove Elements page
- **TC003**: Verify basic page functionality
- **TC004**: Add single element
- **TC005**: Add and remove element
- **TC006**: Add multiple elements
- **TC007**: Remove all elements
- **TC008**: Performance test with many elements

### Basic Auth (`tests/basic_auth.robot`)
- **TC001**: Check Basic Auth link availability on homepage
- **TC002**: Navigate to Basic Auth page with credentials
- **TC003**: Verify Basic Auth success page content
- **TC004**: Basic Auth via homepage navigation
- **TC005**: Multiple Basic Auth access attempts
- **TC006**: Basic Auth page refresh behavior
- **TC007**: Basic Auth URL structure validation
- **TC008**: Basic Auth security headers check

## 🏷️ Available Tags
- `smoke` - Critical tests that must pass
- `navigation` - Page navigation tests
- `content` - Content verification tests
- `functionality` - Feature functionality tests
- `performance` - Performance and stress tests
- `authentication` - Authentication related tests
- `security` - Security related tests
- `ab_testing` - A/B Testing specific tests
- `add_remove` - Add/Remove Elements specific tests
- `basic_auth` - Basic Auth specific tests

## 📁 Key Files

### Configuration
- `requirements.txt` - Python dependencies
- `robot.yaml` - Robot Framework configuration
- `resources/variables.robot` - Global variables and selectors

### Keywords (Reusable Functions)
- `keywords/common_keywords.robot` - Browser operations
- `keywords/homepage_keywords.robot` - Homepage interactions
- `keywords/ab_testing_keywords.robot` - A/B Testing operations
- `keywords/add_remove_keywords.robot` - Add/Remove Elements operations
- `keywords/basic_auth_keywords.robot` - Basic Auth operations

### Results
- `results/report.html` - High-level test report
- `results/log.html` - Detailed execution log
- `results/output.xml` - Machine-readable results

## 🔧 Troubleshooting

### Common Issues
1. **"robot" command not found** → Use `python -m robot` instead
2. **Browser driver issues** → Ensure Chrome/Firefox is installed
3. **Permission errors** → Run as Administrator
4. **Network timeouts** → Check internet connection

### Debug Commands
```cmd
# Run single test for debugging
python -m robot -t "TC001*" -d results tests/ab_testing.robot

# Verbose logging
python -m robot -L DEBUG -d results tests/

# Check test syntax
python -m robot --dryrun tests/
```

## 🌐 Browser Support
- ✅ Chrome (default)
- ✅ Firefox
- ✅ Headless mode for both
- 🔄 Edge (can be added)

## 📈 Next Steps for Expansion
Ready to add tests for other the-internet.herokuapp.com features:
- Checkboxes
- Context Menu
- Drag and Drop
- Dropdown
- Dynamic Content
- File Upload
- Form Authentication
- Hovers
- JavaScript Alerts
- Key Presses
- And 30+ more examples available on the site
