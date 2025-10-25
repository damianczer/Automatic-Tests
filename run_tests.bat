@echo off
echo Running Robot Framework Tests...
echo.

if "%1"=="smoke" (
    echo Running smoke tests...
    python -m robot -i smoke -d results tests/
) else if "%1"=="ab_testing" (
    echo Running A/B Testing tests...
    python -m robot -d results tests/ab_testing.robot
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
