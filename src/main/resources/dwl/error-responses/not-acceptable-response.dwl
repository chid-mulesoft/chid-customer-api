%dw 2.0
output application/json
/**
 * DataWeave transformation for Not Acceptable error response
 * Generates a standardized 406 error response with JSON structure
 */
---
{
    "error": "Not Acceptable",
    "message": "Not acceptable",
    "timestamp": now(),
    "status": 406
}
