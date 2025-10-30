@echo off
echo Running Robot Framework Tests...
echo.

if "%1"=="smoke" (
    echo Running smoke tests...
    python -m robot -i smoke -d results tests/
) else if "%1"=="ab_testing" (
    echo Running A/B Testing tests...
    python -m robot -d results tests/ab_testing.robot
) else if "%1"=="add_remove" (
    echo Running Add/Remove Elements tests...
    python -m robot -d results tests/add_remove_elements.robot
) else if "%1"=="basic_auth" (
    echo Running Basic Auth tests...
    python -m robot -d results tests/basic_auth.robot
) else if "%1"=="checkboxes" (
    echo Running Checkboxes tests...
    python -m robot -d results tests/checkboxes.robot
) else if "%1"=="context_menu" (
    echo Running Context Menu tests...
    python -m robot -d results tests/context_menu.robot
) else if "%1"=="dropdown" (
    echo Running Dropdown tests...
    python -m robot -d results tests/dropdown.robot
) else if "%1"=="drag_and_drop" (
    echo Running Drag and Drop tests...
    python -m robot -d results tests/drag_and_drop.robot
) else if "%1"=="file_upload" (
    echo Running File Upload tests...
    python -m robot -d results tests/file_upload.robot
) else if "%1"=="javascript_alerts" (
    echo Running JavaScript Alerts tests...
    python -m robot -d results tests/javascript_alerts.robot
) else if "%1"=="dynamic_loading" (
    echo Running Dynamic Loading tests...
    python -m robot -d results tests/dynamic_loading.robot
) else if "%1"=="hovers" (
    echo Running Hovers tests...
    python -m robot -d results tests/hovers.robot
) else if "%1"=="headless" (
    echo Running tests in headless mode...
    python -m robot -v HEADLESS:True -d results tests/
) else (
    echo Running all tests...
    python -m robot -d results tests/
)

echo.
echo Tests completed. Check results in 'results' folder
echo Open 'results/report.html' to view the report
pause
