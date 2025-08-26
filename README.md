# StyleGuideSIT_BrowserLib

## Introduction

StyleGuideSIT_BrowserLib is an automated test framework for validating the UI and API of insurance web applications. It leverages [Robot Framework](https://robotframework.org/) with the [Browser library](https://robotframework-browser.org/), custom Python libraries, and integrations with external systems like Jira and BrowserStack. The framework is designed for scalable, maintainable, and data-driven testing, supporting both local and cloud-based executions.

---

## Getting Started

### Prerequisites

- Python 3.8+
- Node.js (for Browser library)
- Robot Framework (`pip install robotframework`)
- Browser Library (`pip install robotframework-browser`)
- Playwright (`rfbrowser init`)
- Other dependencies: `requests`, `robotframework-requests`, etc.

### Installation

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd StyleGuideSIT_BrowserLib
   ```

2. **Install Python dependencies:**
   ```sh
   pip install -r requirements.txt
   ```

3. **Install and initialize Browser library:**
   ```sh
   pip install robotframework-browser
   rfbrowser init
   ```

4. **Configure credentials:**
   - Edit `resources/variables/credentials.properties` with your test credentials.

5. **Set up environment variables (optional):**
   - For BrowserStack, Jira, or other integrations, set the required environment variables or update the config files.

---

## Project Structure

- `resources/`  
  - `settings.resource`: Main resource file, imports libraries and shared resources.
  - `keywords/`: Common and project-specific keywords.
  - `pages/`: Page object files with locators and page-specific keywords.
  - `variables/`: Global variables and properties.
- `libraries/`: Custom Python libraries for Excel, Jira, Contentful, etc.
- `results/`: Test execution reports and logs.
- `tests/`: Robot Framework test suites.
- `README.md`: Project documentation.

---

## Usage

### Running Tests Locally

```sh
robot --outputdir results tests/
```

### Running Tests on BrowserStack

Set `Browserstack_Execution=True` in your environment or config, and provide BrowserStack credentials in `credentials.properties`.

### Test Data

- Test data is managed via Excel files and Robot Framework variables.
- Contentful CMS is used for dynamic content validation.

### Reports

- After execution, HTML and log files are generated in the `results/` folder.
- Reports include detailed test steps, screenshots, and statistics.

---

## Build and Test

- **Build:** No compilation required; ensure all dependencies are installed.
- **Test:** Run Robot Framework test suites as shown above.
- **Custom Libraries:** Python libraries are located in `libraries/` and imported via resource files.

---

## Key Features

- **Browser Automation:** Uses Playwright via Robot Framework Browser library.
- **API Testing:** Integrated with RequestsLibrary.
- **Data-Driven:** Reads test data from Excel and property files.
- **Contentful Validation:** Verifies UI content against CMS.
- **Jira Integration:** Updates test execution status in Jira.
- **BrowserStack Integration:** Supports cloud-based cross-browser testing.
- **Custom Keywords:** Modular and reusable keywords for common actions.
- **Reporting:** Generates detailed HTML reports and logs.

---

**Guidelines:**
- Follow Robot Framework and Python best practices.
- Add docstrings and comments for clarity.
- Update documentation for new features.

---

## References & Further Reading

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Browser Library Docs](https://marketsquare.github.io/robotframework-browser/Browser.html)
- [Playwright Docs](https://playwright.dev/python/docs/intro)
- [Jira API Docs](https://developer.atlassian.com/cloud/jira/platform/rest/v3/intro/)

---

## Support

For any help reach out to QA COE memebers:
    

---
