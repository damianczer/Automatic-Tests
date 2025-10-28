# Quick Reference Guide - Robot Framework Test Project

## ✅ Project Status
- ✅ Working A/B Testing tests (5 test cases)
- ✅ Working Add/Remove Elements tests (8 test cases)
- ✅ Working Basic Auth tests (8 test cases)
- ✅ Working Checkboxes tests (8 test cases)
- ✅ Working Context Menu tests (8 test cases)
- ✅ Working Dropdown tests (8 test cases)
- ✅ Working Drag and Drop tests (8 test cases)
- ✅ Working File Upload tests (8 test cases)
- ✅ Working JavaScript Alerts tests (8 test cases)
- ✅ Working Dynamic Loading tests (8 test cases)
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

# Run Checkboxes tests only
run_tests.bat checkboxes

# Run Context Menu tests only
run_tests.bat context_menu

# Run Dropdown tests only
run_tests.bat dropdown

# Run Drag and Drop tests only
run_tests.bat drag_and_drop

# Run File Upload tests only
run_tests.bat file_upload

# Run JavaScript Alerts tests only
run_tests.bat javascript_alerts

# Run Dynamic Loading tests only
run_tests.bat dynamic_loading

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
python -m robot -i forms -d results tests/
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

### Checkboxes (`tests/checkboxes.robot`)
- **TC001**: Check Checkboxes link availability on homepage
- **TC002**: Navigate to Checkboxes page
- **TC003**: Verify Checkboxes page content
- **TC004**: Check initial checkbox states
- **TC005**: Toggle first checkbox
- **TC006**: Toggle second checkbox
- **TC007**: Multiple checkbox operations
- **TC008**: Checkbox persistence test

### Context Menu (`tests/context_menu.robot`)
- **TC001**: Check Context Menu link availability on homepage
- **TC002**: Navigate to Context Menu page
- **TC003**: Verify Context Menu page content
- **TC004**: Test right click context menu alert (element interaction)
- **TC005**: Test context menu element interaction
- **TC006**: Test context menu box properties
- **TC007**: Multiple context menu box interactions
- **TC008**: Context menu page elements verification

### Dropdown (`tests/dropdown.robot`)
- **TC001**: Check Dropdown link availability on homepage
- **TC002**: Navigate to Dropdown page
- **TC003**: Verify Dropdown page content
- **TC004**: Verify dropdown default state
- **TC005**: Select Option 1 from dropdown
- **TC006**: Select Option 2 from dropdown
- **TC007**: Multiple dropdown selections
- **TC008**: Dropdown options verification

### Drag and Drop (`tests/drag_and_drop.robot`)
- **TC001**: Check Drag and Drop link availability on homepage
- **TC002**: Navigate to Drag and Drop page
- **TC003**: Verify Drag and Drop page content
- **TC004**: Verify initial state of drag and drop elements
- **TC005**: Drag element from column A to column B
- **TC006**: Drag element from column B to column A
- **TC007**: Multiple drag and drop operations
- **TC008**: Drag and drop elements properties verification

### File Upload (`tests/file_upload.robot`)
- **TC001**: Check File Upload link availability on homepage
- **TC002**: Navigate to File Upload page
- **TC003**: Verify File Upload page content
- **TC004**: Verify file upload elements properties
- **TC005**: Upload text file
- **TC006**: Upload different file types
- **TC007**: Multiple file upload operations
- **TC008**: File upload form validation

### JavaScript Alerts (`tests/javascript_alerts.robot`)
- **TC001**: Check JavaScript Alerts link availability on homepage
- **TC002**: Navigate to JavaScript Alerts page
- **TC003**: Verify JavaScript Alerts page content
- **TC004**: Test JavaScript Alert dialog
- **TC005**: Test JavaScript Confirm dialog accept
- **TC006**: Test JavaScript Confirm dialog dismiss
- **TC007**: Test JavaScript Prompt dialog
- **TC008**: Multiple JavaScript alerts operations

### Dynamic Loading (`tests/dynamic_loading.robot`)
- **TC001**: Check Dynamic Loading link availability on homepage
- **TC002**: Navigate to Dynamic Loading page
- **TC003**: Verify Dynamic Loading page content
- **TC004**: Test dynamic loading Example 1 - hidden element
- **TC005**: Test dynamic loading Example 2 - rendered element
- **TC006**: Verify loading states Example 1
- **TC007**: Verify loading states Example 2
- **TC008**: Multiple dynamic loading operations

## 🏷️ Available Tags
- `smoke` - Critical tests that must pass
- `navigation` - Page navigation tests
- `content` - Content verification tests
- `functionality` - Feature functionality tests
- `performance` - Performance and stress tests
- `authentication` - Authentication related tests
- `security` - Security related tests
- `forms` - Form elements testing
- `ab_testing` - A/B Testing specific tests
- `add_remove` - Add/Remove Elements specific tests
- `basic_auth` - Basic Auth specific tests
- `checkboxes` - Checkboxes specific tests
- `context_menu` - Context Menu specific tests
- `dropdown` - Dropdown specific tests
- `drag_and_drop` - Drag and Drop specific tests
- `file_upload` - File Upload specific tests
- `javascript_alerts` - JavaScript Alerts specific tests
- `dynamic_loading` - Dynamic Loading specific tests
- `ajax` - AJAX and dynamic content tests
- `alerts` - Alert dialog tests
- `interaction` - Interactive element tests

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
- `keywords/checkboxes_keywords.robot` - Checkboxes operations

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
- Dynamic Content
- Form Authentication
- Hovers
- Key Presses
- Inputs
- Nested Frames
- Notification Messages
- And 30+ more examples available on the site
