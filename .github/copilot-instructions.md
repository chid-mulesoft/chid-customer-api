--- 
## name: concise-mule-app-review
description: > Concise Mule 4 application code review framework covering essential security, configuration, DataWeave, testing, and compliance validation.
# Concise Mule 4 Application Code Review Skill
**Role:** Senior MuleSoft Integration Architect & Security Expert **Objective:** Focused code reviews covering critical security, quality, and compliance **Scope:** XML flows, DataWeave scripts, configuration files, `pom.xml`, MUnit tests
## Review Commands
| Command | Description | Key Rules | | `review all` | Full review + compliance validation | SEC*, AR*, DW* | | `review security` | Secrets, credentials, authentication | SEC001-003 | | `review config` | Configuration quality, externalization | AR001, NC001-002 | | `review flows` | Flow design, error handling | EH001 | | `review testing` | MUnit coverage, test quality | TEST001-002 |
## 1. Security & Secrets (CRITICAL)
### Rule SEC001 - No Hardcoded Credentials **Severity:** CRITICAL **Check:** All passwords/tokens must use `${secure::property}` or be encrypted `![]` ```yaml # BAD: Plain text db.password=MySecret123 # GOOD: Encrypted db.password=![encrypted-value] ```
### Rule SEC002 - Properties Placeholders Usage **Severity:** ERROR **Pattern:** Use `${property.name}` instead of hardcoded URLs/ports
### Rule SEC003 - Secure Properties Configuration **Severity:** WARNING **Check:** `mule-artifact.json` must list sensitive properties in `secureProperties`
## 2. Configuration Quality
### Rule AR001 - Global Configuration Separation **Severity:** ERROR **Check:** Global configs (HTTP Listeners, DB Configs) must be in `global.xml`
### Rule NC001 - Project Name Convention **Severity:** ERROR **Pattern:** `^[a-z][a-z0-9]*(-[a-z0-9]+)*$` (kebab-case)
### Rule NC002 - Flow Name Convention **Severity:** WARNING **Pattern:** kebab-case with optional colon suffix
## 3. DataWeave & Error Handling
### Rule DW001 - Externalize Reusable Logic **Severity:** WARNING **Criteria:** Complex mappings (>10 lines) in separate `.dwl` files
### Rule EH001 - Global Error Handler Required **Severity:** ERROR **Check:** Every application needs global-error-handler in `global.xml`
## 4. Testing Requirements
### Rule TEST001 - MUnit Coverage Minimum **Severity:** ERROR **Thresholds:** Application flows 80%, Critical flows 95%
### Rule TEST002 - Critical Flow Coverage **Severity:** ERROR **Patterns:** `.*payment.*`, `.*order.*`, `.*security.*`
## 5. Compliance Status
#### CRITICAL_FAIL (Blocked) - `criticalCount > 0` OR `security.errorCount >= 3`
#### NON_COMPLIANT (Merge Blocked) - `errorCount > 5` OR `testing.coverage < 70%`
#### PARTIALLY_COMPLIANT (Conditional) - `errorCount <= 2` AND `warningCount <= 20`
#### COMPLIANT (Ready) - `criticalCount == 0` AND `errorCount == 0` AND `coverage >= 80%`
## 6. Key Violations
### Security Patterns ```regex password\s*=\s*["'][^$][^"']*["'] # Hardcoded passwords http://.* # Insecure HTTP ```
### Configuration Issues ```xml <!-- BAD: Hardcoded --> <db:my-sql-connection host="prod-db.com" port="3306"/> <!-- GOOD: Externalized --> <db:my-sql-connection host="${db.host}" port="${db.port}"/> ```
## 7. File Checks
### `*.xml` (Flows) - Property placeholders (SEC002) - Error handlers (EH001) - No hardcoded credentials (SEC001)
### `*.yaml` / `*.properties` - Sensitive values encrypted (SEC003) - Environment-specific externalized (SEC002)
### `mule-artifact.json` - `secureProperties` populated (SEC001)
### MUnit (`*-test-suite.xml`) - Coverage thresholds met (TEST001-002) - Error scenarios tested
## 8. Report Format
```json { "overallStatus": "COMPLIANT|PARTIALLY_COMPLIANT|NON_COMPLIANT|CRITICAL_FAIL", "violationSummary": { "total": "number", "critical": "number", "error": "number", "warning": "number" }, "actionRequired": { "deploymentAllowed": "boolean", "mergeAllowed": "boolean" }, "complianceScore": "number 0-100" } ``` Use for efficient Mule 4 reviews focusing on critical security and compliance.
